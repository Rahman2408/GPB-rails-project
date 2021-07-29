class Project < ApplicationRecord
    has_many :project_features 
    has_many :users, through: :project_features
end
