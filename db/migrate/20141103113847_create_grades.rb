class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.belongs_to :grader, index: true
      t.belongs_to :student
      t.belongs_to :course
      t.integer :value
      t.text :notes

      t.timestamps null: false
    end

    add_index :grades, [:student_id, :course_id]
  end
end
