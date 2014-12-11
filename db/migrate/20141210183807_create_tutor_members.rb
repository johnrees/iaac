class CreateTutorMembers < ActiveRecord::Migration
  def change
    create_table :tutor_members do |t|
      t.references :user
      t.references :course
      t.integer :ordinal
      t.boolean :can_grade, default: false
      t.string :role_name
      t.text :role_description

      t.timestamps null: false
    end

    add_index :tutor_members, [:user_id, :course_id], unique: true
    add_index :tutor_members, :ordinal
  end
end
