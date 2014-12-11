require 'rails_helper'

RSpec.describe Course, :type => :feature do

  let(:course) { create(:course, name: 'Painting') }
  let(:admin) { create(:user, :admin) }

  before(:each) do
    login admin
  end

  it "lists courses" do
    course.reload
    visit admin_courses_path
    expect(page).to have_link('Painting')
  end

  it "has preview button" do
    visit admin_course_path(course)
    click_link "preview"
    expect(current_path).to eq(course_path(course))
  end

  it "has course page" do
    visit admin_course_path(course)
    expect(page).to have_title('Painting')
  end

  it "can add course" do
    visit admin_courses_path
    click_link "add course"
    fill_in "Name", with: "new course"
    fill_in "Description", with: "desc"
    click_button "Create Course"
    expect(page).to have_content("created")
  end

  it "can edit course" do
    visit admin_course_path(course)
    click_link "edit"
    fill_in "Description", with: "blahblahblah"
    click_button "Update Course"
    expect(page).to have_content("blahblahblah")
  end

  it "can delete course" do
    visit admin_course_path(course)
    click_button "delete"
    expect(page).to have_content("destroyed")
  end

end