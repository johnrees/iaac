class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.belongs_to :user
      t.integer :amount
      t.text :description
      t.datetime :occurred_at

      t.timestamps null: false
    end

    add_index :transactions, [:type, :user_id]
  end
end
