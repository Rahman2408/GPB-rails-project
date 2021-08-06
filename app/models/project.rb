class Project < ActiveRecord::Base 
    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    has_many :project_features,  dependent: :destroy 
    has_many :users, -> {distinct},  through: :project_features
    scope :where_not_mine, ->(user) {where.not("owner_id = ?", user)}
    scope :where_mine, ->(user) {where("owner_id = ?", user)}
    accepts_nested_attributes_for :project_features, reject_if: proc { |attributes| attributes['name'].blank?  }
    validates_presence_of :title, :goal

  def is_mine(user)
     self.owner == user ?  true : false
  end
  
 
  def self.helping_projects(user)
    a = where_not_mine(user).map {|p| p.project_features.where("user_id = ?", user)}
    a = a.flatten.map{|a| a.project}
  end

  def self.other_projects(user)
    a = where_not_mine(user).map {|p| p.project_features.where("user_id != ?", user)}
    a = a.flatten.map{|a| a.project}
  end

end
