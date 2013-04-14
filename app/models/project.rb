class Project < ActiveRecord::Base
  attr_accessible :cover, :description, :lead, :title, :url
end
