class CreateProjectFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :project_features do |t|
      t.string :name
      t.text :description
      t.integer :user_id, null: false, foreign_key: true
      t.integer :project_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
