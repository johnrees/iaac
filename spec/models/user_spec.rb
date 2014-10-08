require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :public_email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it "has name" do
    u = FactoryGirl.build_stubbed(:user, first_name: "Homer", last_name: "Simpson")
    expect(u.to_s).to eq("Homer Simpson")
  end

end
