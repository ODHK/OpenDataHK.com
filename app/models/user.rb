class User < ActiveRecord::Base
  attr_accessible :email, :facebook, :firstname, :github, :googleplus, :lastname, :location, :mailinglist
end
