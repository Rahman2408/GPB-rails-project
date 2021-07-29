class User < ApplicationRecord
    has_many :project_features 
    has_many :projects, through: :project_features
    has_secure_password
end
