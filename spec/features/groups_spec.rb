require 'rails_helper'

RSpec.describe Group, :type => :feature do

  let(:group) { create(:group) }
  let(:admin) { create(:user) }
  before(:each) do
    admin.add_role :admin
    login admin
  end

  it "has index page" do
    visit admin_groups_path
    expect(page).to have_title("Groups")
  end

  it "can add group" do
    visit new_admin_group_path
    fill_in 'Name', with: "New Group"
    click_button "Create Group"
    expect(page).to have_content("successfully created")
  end

  it "can delete group" do
    visit admin_group_path(group)
    click_button "Delete Group"
    expect(current_path).to eq(admin_groups_path)
    expect(page).to have_content("successfully destroyed")
  end

end
