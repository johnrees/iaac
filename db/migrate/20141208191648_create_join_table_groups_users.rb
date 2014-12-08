class CreateJoinTableGroupsUsers < ActiveRecord::Migration
  def change
    create_join_table :groups, :users
    add_index :groups_users, [:group_id, :user_id], unique: true
  end
end
