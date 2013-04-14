class Resource < ActiveRecord::Base
  attr_accessible :description, :tags, :title, :url
end
