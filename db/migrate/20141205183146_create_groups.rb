class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :groups, :ancestry
  end
end
