require 'rails_helper'

RSpec.describe Course, :type => :feature do

  let(:tutor) { FactoryGirl.create(:user) }
  let(:student) { FactoryGirl.create(:user, first_name: 'Bart', last_name: 'Simpson') }
  let(:course) { FactoryGirl.create(:course) }

  before(:each) do
    tutor.add_role :tutor, course
    student.add_role :student, course
  end

  it "can see course grades" do
    login tutor
    visit course_path(course)
    click_link "grades"
    expect(page).to have_title("Grades")
    expect(page).to have_content("Bart Simpson")
  end

# 0-3   FAIL (this means that the student is not going to get his Master Degree, so this grade has to be justified and well explained)
# 4     INCOMPLETE (this means that the tutor has to offer another deadline in order to receive a second submission that he will grade again)
# 5-6   LOW PASS
# 7-8   PASS
# 9-10  HIGH PASS

end