class AddGradeableToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :gradeable, :boolean, default: false
  end
end
