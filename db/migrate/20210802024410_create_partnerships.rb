class CreatePartnerships < ActiveRecord::Migration[6.1]
  def change
    create_table :partnerships do |t|
      t.integer :user_id
      t.integer :partner_id

      t.timestamps
    end
  end
end
