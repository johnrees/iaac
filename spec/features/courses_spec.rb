require 'rails_helper'

RSpec.describe Course, :type => :feature do

  it "lists courses" do
    visit '/courses'
    expect(page).to have_title("Courses")
  end

  it "can view individual course" do
    FactoryGirl.create(:course, name: 'cool course')
    visit '/courses'
    click_link('cool course')
    expect(page).to have_title("cool course")
  end

end