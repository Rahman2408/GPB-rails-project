class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :goal
      t.integer :owner_id, foreign_key: true

    end
  end
end
