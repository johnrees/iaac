class AddAncestryToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ancestry, :string, index: true
  end
end
