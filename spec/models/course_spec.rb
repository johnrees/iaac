require 'rails_helper'

RSpec.describe Course, :type => :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_many(:grades) }

  skip "acts as tree"
  skip "resourcify"

  let(:course) { create(:course) }
  let(:user) { create(:user) }

  skip "has self.for method"

  it "has full name" do
    expect(build_stubbed(:course, name: 'AA', subtitle: 'BB').full_name).to eq('AA / BB')
  end

  it "has to_s" do
    expect(build_stubbed(:course, name: 'MAA').to_s).to eq('MAA')
  end

  it "has tutors" do
    expect(course.tutors).to be_empty
    course.tutors << user
    expect(course.tutors).to include(user)
  end

  it "has students" do
    expect(course.students).to be_empty
    course.students << user
    expect(course.students).to include(user)
  end

  # %w(student tutor).each do |type|
  #   it "has add_people before_update (#{type}s)" do
  #     3.times do
  #       u = create(:user)
  #       u.add_role type, course
  #     end
  #     expect(course.send(type.pluralize).count).to eq(3)
  #     # FIX THIS
  #     course.tutor_ids = [user.id]
  #     course.student_ids = [user.id]

  #     course.save!
  #     expect(course.send(type.pluralize)).to eq([user])
  #   end
  # end


end
