class AddFinancialStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :financial_status, :integer, default: 0
    add_index :users, :financial_status
  end
end
