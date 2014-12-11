class CreateStudentMembers < ActiveRecord::Migration
  def change
    create_table :student_members do |t|
      t.references :user
      t.references :course
      t.references :group
      t.timestamps null: false
    end
    add_index :student_members, [:user_id, :course_id], unique: true
    add_index :student_members, :group_id
  end
end
