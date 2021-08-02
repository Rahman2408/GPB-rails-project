class AddPartnerUserIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :partner_user_ids, :integer
  end
end
