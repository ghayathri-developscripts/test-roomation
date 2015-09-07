server "li483-107.members.linode.com", :web, :app, :db, primary: true

set :deploy_to, "/var/www/#{application}"
set :current_path, "#{deploy_to}/current"
set :deploy_via, :remote_cache
set :user, "deployer"
set :branch, "master"

