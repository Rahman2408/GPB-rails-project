class User < ApplicationRecord
    has_one :project, inverse_of: :owner
    has_many :project_features
    has_many :projects, -> {distinct}, through: :project_features
    has_many :partners, -> {distinct}, class_name: "User", foreign_key: "project_owner_id"
    belongs_to :project_owner, class_name: "User", optional: true
    scope :not_me, ->(user) {where.not("id = ?", user)}
    validates :email, :uniqueness => { case_sensitive: false }, presence: true
    validates :name , presence: true
    has_secure_password

    def self.github_access(user_creds)
        find_or_create_by(email: user_creds[:info][:email]) do |user|
          user.id = user_creds.uid
          user.name = user_creds[:info][:name]
          user.password = SecureRandom.hex
        end
    end

    def self.partner_search(string)
        where("name LIKE ?", "%#{string}%")
    end

    def self.common_partners(user)
        user = self.find(user)
        user.partners 
    end

    def self.other_users(user)
        user = self.find(user)
        all.not_me(user).select {|p| p.partners != user.partners}
    end 
end 
