class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string  :group_project
      t.integer :user_id, foreign_key: true
      t.integer :partner_id, foreign_key: true
      t.integer :project_id, foreign_key: true
      
      t.timestamps
    end
  end
end
