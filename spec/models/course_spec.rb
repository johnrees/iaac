require 'rails_helper'

RSpec.describe Course, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  skip "acts as tree"
  skip "resourcify"

  it "should have to_s" do
    expect(FactoryGirl.build_stubbed(:course, name: 'MAA').to_s).to eq('MAA')
  end

end
