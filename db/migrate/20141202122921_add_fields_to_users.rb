class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :dob, :date
    add_column :users, :mach_id, :integer
    add_column :users, :data, :text
  end
end
