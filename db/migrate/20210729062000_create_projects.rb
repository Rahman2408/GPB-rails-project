class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :goal
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
