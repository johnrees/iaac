require 'rails_helper'

RSpec.describe Charge, :type => :model do

  it "makes amount negative" do
    charge = create(:charge, amount: 300)
    expect(charge.amount).to eq(-300)
    charge = create(:charge, amount: -100)
    expect(charge.amount).to eq(-100)
  end


end
