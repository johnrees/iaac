require 'rails_helper'

RSpec.describe User, :type => :model do

  it { should have_and_belong_to_many :groups }
  it { should validate_presence_of :public_email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  # it { should validate_presence_of :country_code }
  it { should validate_uniqueness_of :public_email }
  it { should validate_uniqueness_of :private_email }

  it { should have_many(:given_grades) }
  it { should have_many(:received_grades) }

  let(:user) {
    build_stubbed(:user, first_name: "Homer", last_name: "Simpson")
  }

  it "has name as to_s" do
    expect(user.to_s).to eq("Homer Simpson")
  end

  it "has country" do
    expect(build_stubbed(:user, country_code: 'fr').country.to_s).to eq('France')
  end

  skip "has courses"

  it "has enrolled_in?" do
    user = create(:user)
    course = create(:course)
    # expect(user.has_role? :student, course).to be_falsey
    expect(user.enrolled_in? course).to be_falsey
    course.students << user
    # user.add_role :student, course
    # expect(user.has_role? :student, course).to be_truthy
    expect(user.enrolled_in? course).to be_truthy
  end

  it "has third_person_singular" do
    user.gender = nil
    expect(user.third_person_singular).to eq('themself')
    user.gender = 'M'
    expect(user.third_person_singular).to eq('himself')
    user.gender = 'm'
    expect(user.third_person_singular).to eq('himself')
    user.gender = 'F'
    expect(user.third_person_singular).to eq('herself')
  end

end
