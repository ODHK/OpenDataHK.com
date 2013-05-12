class Project < ActiveRecord::Base
  attr_accessible :cover, :description, :title, :url, :stage, :users, :project_roles

  has_many :users, :through => :project_roles
  has_many :project_roles, :foreign_key => :project_id

  STAGES = %w[ proposal building completed ]

end
