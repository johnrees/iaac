require 'rails_helper'

RSpec.describe Group, :type => :feature do

  let(:admin) { create(:user) }
  before(:each) do
    admin.add_role :admin
  end

  it "has index page" do
    login admin
    visit admin_groups_path
    expect(page).to have_title("Groups")
  end

  it "can add group" do
    login admin
    visit new_admin_group_path
    fill_in 'Name', with: "New Group"
    click_button "Create Group"
    expect(page).to have_content("successfully created")
  end

end
