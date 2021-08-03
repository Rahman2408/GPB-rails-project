class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :goal
      t.integer :group_id, foreign_key: true

    end
  end
end
