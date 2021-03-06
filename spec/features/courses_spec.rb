require 'rails_helper'

RSpec.describe Course, :type => :feature do

  it "lists courses" do
    login
    visit '/courses'
    expect(page).to have_title("Courses")
  end

  skip "can add new tutors"
  skip "can add new students"

  skip "can add course" do
    user = create(:user, :admin)
    login user
    visit courses_path
    click_link "add course"
    fill_in "Name", with: "new course"
    fill_in "Description", with: "desc"
    click_button "Create Course"
    expect(page).to have_content("created")
  end

  it "can view individual course" do
    user = create(:user)
    course = create(:course, name: 'cool course')
    course.students << user
    login user
    visit '/courses'
    click_link('cool course')
    expect(page).to have_title("cool course")
  end

  it "can edit course" do
    course = create(:course, name: 'cool course')
    user = create(:user)
    course.tutors << user
    login user
    visit course_path(course)
    click_link "edit course"
    fill_in "Name", with: "BLAH"
    click_button "Update Course"
    expect(page).to have_title("BLAH")
  end

end