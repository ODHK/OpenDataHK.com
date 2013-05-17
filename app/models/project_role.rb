class ProjectRole < ActiveRecord::Base
  attr_accessible :user_id, :project_id, :role

  ap "hello"
  
  belongs_to :user
  belongs_to :project

  ROLES = %w[ member owner ]

  def is_owner?
    self.role == ROLES[1]
  end
  
  def is_member?
    self.role == ROLES[0]
  end

end
