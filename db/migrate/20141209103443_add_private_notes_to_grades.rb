class AddPrivateNotesToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :private_notes, :text
  end
end
