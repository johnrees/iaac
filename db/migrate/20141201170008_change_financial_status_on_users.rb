class ChangeFinancialStatusOnUsers < ActiveRecord::Migration
  def change
    # Transaction.destroy_all
    User.update_all(financial_status: 0)
    change_column :users, :financial_status, :decimal, precision: 8, scale: 2
  end
end
