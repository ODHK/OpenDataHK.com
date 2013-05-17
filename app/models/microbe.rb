class Microbe < ActiveRecord::Base
  default_scope order: 'created_at DESC'
  attr_accessible :content, :project_id, :user_id
  belongs_to :user
  belongs_to :project
end
