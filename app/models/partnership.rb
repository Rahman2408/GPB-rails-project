class Partnership < ActiveRecord::Base
  belongs_to :user 
  belongs_to :partner, class_name: 'User'

  validates_presence_of :user_id, :partner_id 
  validate :user_is_not_equal_to_partner
  validates_uniqueness_of :user_id, scope: [:partner_id]

  def is_mutual?
    self.partner.partners.include?(self.user)
  end

  private

  def user_is_not_equal_to_partner
    errors.add(:partner, "can't be the same as the user") if self.user == self.partner
  end

end