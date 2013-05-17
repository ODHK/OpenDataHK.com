class Project < ActiveRecord::Base
  attr_accessible :cover, :description, :title, :url, :stage, :users, :project_roles, 
  				  :github_repo, :github_user

  has_many :users, :through => :project_roles
  has_many :project_roles, :foreign_key => :project_id
  has_many :microbes
  
  STAGES = %w[ proposal shelved development inactive released ]

  def owner
  	owner_ids = self.project_roles.map{|role| role.user_id if role.role == "owner"}.compact
  	owner_ids.map{|id| User.find(id)}[0] # One Owner only.
  end

  def members
  	owner_ids = self.project_roles.map{|role| role.user_id if role.role == "member"}.compact
  	owner_ids.map{|id| User.find(id)} # Multiple members only.
  end

end
