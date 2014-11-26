class AddPublishedToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :published, :boolean, index: true, default: false
  end
end
