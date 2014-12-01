class ChangeIntegersToBigdecimals < ActiveRecord::Migration
  def change
    Transaction.destroy_all
    Grade.destroy_all
    change_column :transactions, :amount, :decimal, precision: 8, scale: 2
    change_column :grades, :value, :decimal, precision: 6, scale: 2
  end
end
