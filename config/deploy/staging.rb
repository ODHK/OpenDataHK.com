server "opendatahk.com", :app, :web, :db, :primary => true
set :deploy_to, "/srv/www/beta.OpenDataHK.com"
set :rails_env, 'test'
set :branch, 'master'