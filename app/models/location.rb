class Location < ActiveRecord::Base
  attr_accessible :address, :details, :email, :name
  has_many :events
end
