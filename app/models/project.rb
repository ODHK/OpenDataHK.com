class Project < ActiveRecord::Base
  load_and_authorize_resource
  attr_accessible :cover, :description, :title, :url

  has_many :users, :through => :project_roles
  has_many :project_roles

  STAGES = %w[ proposal building completed ]

end
