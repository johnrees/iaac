class RemoveTreeFieldsFromCourses < ActiveRecord::Migration
  def change
    remove_index :courses, [:parent_id, :sort_order]
    remove_column :courses, :sort_order, :integer
    remove_reference :courses, :parent
  end
end
