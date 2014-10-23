require 'rails_helper'

RSpec.describe Course, :type => :feature do

  it "lists courses" do
    login
    visit '/courses'
    expect(page).to have_title("Courses")
  end

  it "can view individual course" do
    user = create(:user)
    course = create(:course, name: 'cool course')
    user.add_role :student, course
    login user
    visit '/courses'
    click_link('cool course')
    expect(page).to have_title("cool course")
  end

  it "can edit course" do
    course = create(:course, name: 'cool course')
    user = create(:user)
    user.add_role :tutor, course
    login user
    visit course_path(course)
    click_link "edit"
    fill_in "Description", with: "blahblahblah"
    click_button "Update Course"
    expect(page).to have_content("blahblahblah")
  end

end