class AddNameToPartnerships < ActiveRecord::Migration[6.1]
  def change
    add_column :partnerships, :name, :string
  end
end
