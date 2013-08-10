# Command Log for Digital Ocean

## SSH Administration
On your local machine
	sudo vim /etc/hosts # Change 

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
	git clone https://github.com/rupa/z.git
 ~/Tools/z/

## Authentication

	ssh-keygen -t rsa -C "info@opendatahk.com"
	cat .ssh/id_rsa.pub # Distribute it to relevant services
	visudo # comment out: #Default requiretty

## DB

	sudo yum install -y postgresql postgresql-devel


## Python Environment
	yg python-pip python-virtualenv python-virtualenvwrapper

## Ruby Environment
	# curl -L get.rvm.io | bash -s stable # install latest stable version of rvm
	# usermod -G rvm -a odhk
	curl -L get.rvm.io | bash -s stable # install for user
	rvm reqruiements # install rvm dependencies

	rvm install 2.0.0 # install ruby versions
	rvm install 1.9.3
	rvm use 1.9.3 --default
	gem install rails --no-ri --no-rdoc

