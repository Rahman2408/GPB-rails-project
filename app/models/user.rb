class User < ApplicationRecord
    has_many :project_features 
    has_many :projects, through: :project_features
    has_secure_password
    validates :email, uniqueness: true, uniqueness: {case_sensitive: false }, presence: true
    validates :name , presence: true
    validates :password, length: {minimum: 7}
end
