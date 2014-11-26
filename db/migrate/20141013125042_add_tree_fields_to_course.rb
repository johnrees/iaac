class AddTreeFieldsToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :parent
    add_column :courses, :sort_order, :integer
    add_index :courses, [:parent_id, :sort_order]
  end
end
