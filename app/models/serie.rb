class Serie < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :events
end
