class CreatePartnerships < ActiveRecord::Migration[6.1]
  def change
    create_table :partnerships do |t|
      t.integer :user_id, foreign_key: true
      t.integer :partner_id, foreign_key: true
      
      t.timestamps
    end
  end
end
