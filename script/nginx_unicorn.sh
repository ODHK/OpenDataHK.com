sudo systemctl stop nginx
pid=`cat $RAILS_ROOT/tmp/pids/unicorn.pid`
kill -QUIT $pid
sleep 3
sudo systemctl start nginx
unicorn -D -d -E production -c $RAILS_ROOT/config/unicorn.rb
