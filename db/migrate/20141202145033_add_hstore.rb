class AddHstore < ActiveRecord::Migration
  def up
    enable_extension :hstore
    add_column :users, :meta, :hstore
  end

  def down
    remove_column :users, :meta, :hstore
    disable_extension :hstore
  end
end