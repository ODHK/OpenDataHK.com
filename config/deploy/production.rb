server "opendatahk.com", :app, :web, :db, :primary => true
set :deploy_to, "/srv/www/OpenDataHK.com"
set :rails_env, 'production'
set :branch, 'production'