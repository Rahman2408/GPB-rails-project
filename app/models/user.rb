class User < ActiveRecord::Base
    has_many :project_features
    has_many :projects, -> {distinct}, through: :project_features
    validates :email, :uniqueness => { case_sensitive: false }, presence: true
    validates :name , presence: true
    has_secure_password

    def self.github_access(user_creds)
        find_or_create_by(email: user_creds[:email]) do |user|
            user.name = user_creds[:name]
            user.password = SecureRandom.hex
        end
    end

    def self.search(string)
        if string.present?
        where("name or email LIKE ?", "%#{string}%")
        else 
          self.all
        end 
     end

end 
