class Project < ApplicationRecord
    has_many :project_features
    has_many :partnerships
    has_many :partners, through: :partnerships
    has_many :users, through: :project_features
    accepts_nested_attributes_for :partner_ids
end
