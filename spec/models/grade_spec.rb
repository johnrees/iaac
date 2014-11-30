require 'rails_helper'

RSpec.describe Grade, :type => :model do

  it { should belong_to(:grader) }
  it { should belong_to(:student) }
  it { should belong_to(:course) }
  skip { should validate_presence_of(:grader) }
  skip { should validate_presence_of(:student) }
  skip { should validate_presence_of(:course) }
  skip { should validate_presence_of(:value) }

  it "has to_s" do
    course = build(:course, name: 'a course')
    grade = build(:grade, value: 3, course: course)
    expect(grade.to_s).to eq('3 - a course')
  end

end
