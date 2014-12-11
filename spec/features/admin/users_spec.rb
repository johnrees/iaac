require 'rails_helper'

RSpec.describe User, :type => :feature do

  let(:admin) { create(:user, :admin) }
  before(:each) do
    login admin
  end

  it "can destroy multiple users" do
    3.times { create(:user) }
    visit admin_users_path

    # avoid weird error
    # User.all.map(&:id)

    expect(page).to have_selector('tr.user', count: 4) # includes admin

    check("user-#{User.last.id}")
    click_button "Delete Selected"

    expect(page).to have_content('destroyed')
    expect(page).to have_selector('tr.user', count: 3)
  end

  it "can edit user" do
    user = create(:user)
    visit admin_user_path(user)
    click_link "Edit details"
    fill_in "First name", with: "Frank"
    click_button "Update"
    expect(page).to have_content("Frank")
    expect(page).to have_content("successfully updated")
  end

  it "lists STUDENTS" do
    u = create(:user, first_name: 'Steve', last_name: 'Irwin')
    course = create(:course)
    course.students << u
    visit admin_users_path
    expect(page).to have_link('Irwin')
  end

  it "has user page" do
    user = create(:user, first_name: 'Steve', last_name: 'Irwin')
    visit admin_user_path(user)
    expect(page).to have_title('Steve Irwin')
  end

end