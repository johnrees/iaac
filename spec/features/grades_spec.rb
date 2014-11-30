require 'rails_helper'

RSpec.describe Grade, :type => :feature do

  let(:tutor) { create(:user) }
  let(:student) { create(:user, first_name: 'Bart', last_name: 'Simpson') }
  let(:course) { create(:course) }

  before(:each) do
    tutor.add_role :tutor, course
    student.add_role :student, course
  end

  it "can submit for review" do
    login tutor
    visit course_grades_path(course)
    fill_in "Value", with: 8.95
    # choose "value-#{student.id}-2", visible: false
    fill_in "notes-#{student.id}", with: "These are some notes"
    click_button "Create Grade"
    click_link "Submit for Review"
    expect(page).to have_content("sent")
  end

  it "can see course grades" do
    login tutor
    visit course_path(course)
    click_link "grades"
    expect(page).to have_title("Grades")
    expect(page).to have_content("Bart Simpson")
  end

  it "can add grades" do
    login tutor
    visit course_grades_path(course)
    fill_in "Value", with: 2.14
    # choose "value-#{student.id}-2", visible: false
    fill_in "notes-#{student.id}", with: "These are some notes"
    click_button "Create Grade"
    expect(page).to have_content("successfully created")
  end

  it "can update grades" do
    create(:grade, student: student, value: 1, course: course)
    login tutor
    visit course_grades_path(course)
    fill_in "Value", with: 7.99
    # choose "value-#{student.id}-1", visible: false
    fill_in "notes-#{student.id}", with: "These are some notes"
    click_button "Update Grade"
    expect(page).to have_content("successfully updated")
  end

end
