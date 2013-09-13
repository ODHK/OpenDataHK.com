namespace :unicorn do
	desc "Zero-downtime restart of Unicorn"
	task :restart, :except => { :no_release => true } do
	  run "kill -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
	end

	desc "Start unicorn"
	task :start, :except => { :no_release => true } do
	  run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E production"
	end

	desc "Stop unicorn"
	task :stop, :except => { :no_release => true } do
	  run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
	end
end