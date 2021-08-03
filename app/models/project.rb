class Project < ActiveRecord::Base 
    belongs_to :group, optional: true 
    belongs_to :user 
    has_many :partners, class_name: 'User', optional: true
    has_many :project_features
    has_many :users, through: :project_features
    accepts_nested_attributes_for :partners
    validates_presence_of :title, :goal
  
    def self.set_partners(contributors)
        arry=[]
        contributors[1..-1].map{|u| arry << User.find_by_id(u)}
        arry
      end
    # def partners=(partners) 
    #     partners[1..-1].each do |partner|
    #         partner = User.find_by_email(partner)
    #             self.partners << partner
    #     end
    # end


end
