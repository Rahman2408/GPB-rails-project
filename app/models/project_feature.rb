class ProjectFeature < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :name, presence: true 
  
  def is_mine(user)
    self.user_id == user ?  true : false
  end
  
end
