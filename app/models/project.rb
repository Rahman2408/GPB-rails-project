class Project < ActiveRecord::Base 
    has_many :project_features
    has_many :users, through: :project_features,  dependent: :destroy 
    accepts_nested_attributes_for :project_features, reject_if: proc { |attributes| attributes['name'].blank? }
    validates_presence_of :title, :goal
end
