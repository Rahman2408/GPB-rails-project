class User < ApplicationRecord
    has_many :project_features, :partner_user_ids
    has_many :projects, through: :project_features
    validates :email, uniqueness: true, uniqueness: {case_sensitive: false }, presence: true
    validates :name , presence: true
    has_secure_password

    def self.github_access(user_creds)
        find_or_create_by(email: user_creds[:email]) do |user|
            user.name = user_creds[:name]
            user.password = SecureRandom.hex
        end
    end

    

end
