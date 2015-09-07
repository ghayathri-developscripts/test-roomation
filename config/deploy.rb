set :stages, %w(staging production)
set :default_stage, 'staging'

require 'rvm/capistrano'
require 'capistrano_colors'
require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :rails_env, 'production'
set :application, 'roomations'
set(:runner) { user }
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :scm, :git
set :repository, 'git@gitlab.sphereinc.com:roomations.git'

set :using_rvm, true
set :rvm_ruby_string, "ruby-1.9.2-p290@#{application}"
set(:rvm_path) { "/home/#{user}/.rvm" }
set(:rvm_bin_path) { "#{rvm_path}/bin" }

set(:unicorn_binary) { "bundle exec unicorn" }
set(:unicorn_config) { "#{current_path}/config/unicorn.rb" }
set(:unicorn_pid)    { "#{current_path}/tmp/pids/unicorn.pid" }

set :shared_children, %w(log)

# ================================================================
# CAPISTRANO CALLBACKS
# ================================================================

after 'deploy:update_code', 'util:symlink:all'
after 'deploy', 'deploy:cleanup', 'deploy:migrate', 'deploy:assets:precompile', 'deploy:seed_fu', 'unicorn:restart'

# ================================================================
# CAPISTRANO TASKS
# ================================================================

namespace :util do

  namespace :symlink do
    desc 'Symlinks files and folders that are meant to be persistent across deploys from the shared directory'
    task :all do
      util.symlink.db_config_file
      util.symlink.images_folder
      util.symlink.sockets_dir
      util.symlink.pids_dir
    end
    
    desc 'Symlinks the database.yml file from shared/config'
    task :db_config_file do
      run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    end
  
    desc 'Symlinks images fiolder from shared/uploads'
    task :images_folder do
      run "ln -nfs #{deploy_to}/#{shared_dir}/uploads #{release_path}/public/uploads"
    end

    desc %{Makes symlink to sockets dir}
    task :sockets_dir do
      run "ln -nfs #{deploy_to}/#{shared_dir}/sockets #{release_path}/tmp/sockets"
    end

    desc %{Makes symlink to pids}
    task :pids_dir do
      run "ln -nfs #{deploy_to}/#{shared_dir}/pids #{release_path}/tmp/pids"
    end
  end
end

# =============================================================================
# OVERRIDE CAPISTRANO TASKS
# =============================================================================

namespace :deploy do
  
  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    run "mkdir -p #{deploy_to}/#{shared_dir}/config"
    put File.read("config/database.example.yml"), "#{deploy_to}/#{shared_dir}/config/database.yml"
    run "mkdir -p #{deploy_to}/#{shared_dir}/uploads"
    run "mkdir -p #{deploy_to}/#{shared_dir}/sockets"
    run "mkdir -p #{deploy_to}/#{shared_dir}/pids"
    puts "Now edit the config files in #{shared_dir}."
  end
  
  after "deploy:setup", "deploy:setup_config"
  
  namespace :assets do
    desc %{Precompile assets}
    task :precompile do
      run "cd #{current_path} && bundle exec rake assets:precompile RAILS_ENV=#{rails_env}"
    end
  end

  task :seed_fu do
    run "cd #{current_path} && bundle exec rake db:seed_fu RAILS_ENV=#{rails_env}"
  end
  
  task :migrate do
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
  end
  
end

namespace :unicorn do
  desc %{Start unicorn}
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end

  desc %{Stop unicorn}
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end

  desc %{Graceful stop unicorn}
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end

  desc %{Reload unicorn}
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  
  desc %{Restart unicorn}
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end
