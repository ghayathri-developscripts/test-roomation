#role :app, 'roomations.sphereinc.com'
#role :web, 'roomations.sphereinc.com'
#role :db,  'roomations.sphereinc.com', :primary => true

role :app, 'demo1.sphereinc.com'
role :web, 'demo1.sphereinc.com'
role :db,  'demo1.sphereinc.com', :primary => true

set :user, 'roomations'

set :deploy_to, "/home/#{user}/staging"
set :current_path, "#{deploy_to}/current"
set :branch, "master"

set :deploy_via, :remote_cache