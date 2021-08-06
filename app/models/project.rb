class Project < ActiveRecord::Base 
    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    has_many :project_features,  dependent: :destroy 
    has_many :users, -> {distinct},  through: :project_features
    accepts_nested_attributes_for :project_features, reject_if: proc { |attributes| attributes['name'].blank?  }
    validates_presence_of :title, :goal

  def is_mine(user)
     self.owner == user ?  true : false
  end

end
