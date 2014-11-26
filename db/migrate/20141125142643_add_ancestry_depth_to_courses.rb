class AddAncestryDepthToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ancestry_depth, :integer, default: 0
  end
end
