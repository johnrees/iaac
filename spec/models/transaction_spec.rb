require 'rails_helper'

RSpec.describe Transaction, :type => :model do

  skip { should validate_presence_of(:amount_as_decimal)}
  it { should validate_presence_of(:description)}
  it { should belong_to(:user) }

  skip "has self.total"
  skip "has amount_as_decimal"

  it "calls update_user after_save" do
    transaction = create(:transaction, amount: 100)
    create(:transaction, amount: 50, user: transaction.user)
    expect(transaction.user.financial_status).to eq(150)
  end

  it "has total" do
    create(:transaction, amount: 100.50)
    create(:transaction, amount: 200.00)
    expect(Transaction.total).to eq(300.50)
  end

  # it "has amount_as_decimal" do
  #   transaction = create(:transaction, amount_as_decimal: "$300.00")
  #   expect(transaction.amount).to eq(30000)
  # end

end
