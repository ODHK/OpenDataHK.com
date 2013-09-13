set :bundle_flags, "--quiet"

require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require "rvm/capistrano"

# default_run_options[:shell] = '/bin/zsh'

set :default_shell, "/bin/zsh"
set :user, "odhk"
set :rvm_ruby_string, :local

before 'deploy:setup', 'rvm:install_rvm'  # install RVM
before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset, OR:

set :bundle_cmd, '/home/odhk/.rvm/gems/ruby-1.9.3-p448/bin/bundle'

set :stages, ["staging","production"]
set :default_stage, "production"

set :application, "odhk"

set :repository,  "git@github.com:ODHK/OpenDataHK.com.git"
set :scm, :git
set :scm_passphrase, ""
# set :use_sudo, false

# set :normalize_asset_timestamps, false

set :deploy_via, :remote_cache

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    # sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/nginx.conf"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/production`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
