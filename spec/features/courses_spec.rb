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

end