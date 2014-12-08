class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.timestamps null: false
    end

    add_index :group_users, [:user_id, :group_id], unique: true
  end
end
