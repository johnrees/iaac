require 'rails_helper'

RSpec.describe User, :type => :feature do

  let(:admin) { create(:user) }
  before(:each) do
    admin.add_role :admin
  end

  it "can destroy multiple users" do
    3.times { create(:user) }
    login admin
    visit admin_users_path

    expect(page).to have_selector('tr.user', count: 4) # includes admin

    find(:css, "tr.user:nth-child(2) input[type=checkbox]").set(true)
    find(:css, "tr.user:nth-child(3) input[type=checkbox]").set(true)
    click_button "Delete Selected"

    expect(page).to have_content('destroyed')
    expect(page).to have_selector('tr.user', count: 2)
  end

  it "can edit user" do
    user = create(:user)
    login admin
    visit admin_user_path(user)
    click_link "Edit details"
    fill_in "First name", with: "Frank"
    click_button "Update"
    expect(page).to have_content("Frank")
    expect(page).to have_content("successfully updated")
  end

  it "lists STUDENTS" do
    u = create(:user, first_name: 'Steve', last_name: 'Irwin')
    u.add_role(:student, create(:course))
    login admin
    visit admin_users_path
    expect(page).to have_link('Irwin')
  end

  it "has user page" do
    user = create(:user, first_name: 'Steve', last_name: 'Irwin')
    login admin
    visit admin_user_path(user)
    expect(page).to have_title('Steve Irwin')
  end

end