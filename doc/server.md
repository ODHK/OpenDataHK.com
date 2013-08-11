# Command Log for Digital Ocean

Setup in the spirit of this [guide](http://ariejan.net/2011/09/14/lighting-fast-zero-downtime-deployments-with-git-capistrano-nginx-and-unicorn/) 

## SSH Administration

On your local machine
	sudo vim /etc/hosts # add odhk.com for easy reference

## User Administration

	passwd # Change root password
	useradd -G wheel odhk # Add user odhk and add them to wheel group
	visudo # allow wheel users to sudo without password
	passwd odhk # Set odhk user password

## System Administration

	# !! Don't bother updating until they allow loading custom kernels from your Virtual Machine's bootloader
	fedup-cli --network 19 --debuglog /root/fedup.debug.log # Upgrade to latest fedora release	

## Console Tools

	sudo yum -y install git zsh python-pip python-virtualenv
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
	chsh # change shell to /bin/zsh
	#! Config .zshrc to you liking 
	#! Config ~/.oh-my-zsh/themes/*.zsh-theme to your liking
	wget https://hub.github.com/standalone
	sudo mv standalone /usr/bin/hub
	chmod 777 /usr/bin/hub
	git clone https://github.com/rupa/z.git ~/Tools/z/

## Authentication

	ssh-keygen -t rsa -C "info@opendatahk.com" # Generate SSH key
	cat .ssh/id_rsa.pub # Distribute it to relevant services
	#! ssh-copy-id -i ~/.ssh/id_rsa.pub odhk@odhk # Passwordless login

	# visudo # comment out: #Default requiretty

## DB

	sudo useradd postgres
	## Follow the [guide](http://www.if-not-true-then-false.com/2012/install-postgresql-on-fedora-centos-red-hat-rhel/)
	yum install postgresql-devel
	bundle config build.pg --with-pg-config=/usr/pgsql-9.2/bin/pg_config

## Nginx

	## Follow the [guide](http://www.if-not-true-then-false.com/2011/install-nginx-php-fpm-on-fedora-centos-red-hat-rhel/)

## Python Environment

	yg python-pip python-virtualenv python-virtualenvwrapper

## Ruby Environment

	curl -L get.rvm.io | bash -s stable # install for user
	rvm reqruiements # install rvm dependencies

	rvm install 2.0.0 # install ruby versions
	rvm install 1.9.3

 	RAILS_ENV=production, in `/etc/environment`

## Deployment 

	#! Setup Capistrano to manage deployments	
	cd /srv/www/OpenDataHK.com/current


