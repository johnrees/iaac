class AddClearanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clearance, :integer, default: 0, null: false
    add_index :users, :clearance
  end
end
