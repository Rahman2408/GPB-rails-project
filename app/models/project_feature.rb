class ProjectFeature < ActiveRecord::Base
  belongs_to :user
  belongs_to :project,  dependent: :destroy 
end
