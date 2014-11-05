require 'rails_helper'

RSpec.describe Course, :type => :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_many(:grades) }

  skip "acts as tree"
  skip "resourcify"

  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }

  it "has to_s" do
    expect(FactoryGirl.build_stubbed(:course, name: 'MAA').to_s).to eq('MAA')
  end

  it "has tutors" do
    expect(course.tutors).to be_empty
    user.add_role :tutor, course
    expect(course.tutors).to include(user)
  end

  it "has students" do
    expect(course.students).to be_empty
    user.add_role :student, course
    expect(course.students).to include(user)
  end

  it "has add_people before_update (students)" do
    course.student_ids = [user.id]
    course.save!
    expect(course.students).to include(user)
  end

  it "has add_people before_update (tutors)" do
    course.tutor_ids = [user.id]
    course.save!
    expect(course.tutors).to include(user)
  end

end
