class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :type
      t.belongs_to :course
      t.belongs_to :user

      t.timestamps null: false
    end
    add_index :members, [:type, :course_id, :user_id], unique: true
  end
end
