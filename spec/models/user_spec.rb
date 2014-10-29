require 'rails_helper'

RSpec.describe User, :type => :model do

  it { should validate_presence_of :public_email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :country_code }

  let(:user) {
    FactoryGirl.build_stubbed(:user, first_name: "Homer", last_name: "Simpson")
  }

  it "has name as to_s" do
    expect(user.to_s).to eq("Homer Simpson")
  end

  it "has country" do
    expect(FactoryGirl.build_stubbed(:user, country_code: 'fr').country.to_s).to eq('France')
  end

end
