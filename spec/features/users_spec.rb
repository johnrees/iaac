require 'rails_helper'

RSpec.describe User, :type => :feature do

  it "can logout" do
    login
    click_link('Log Out')
    expect(page).to have_button('Log In')
  end

  it "can edit profile" do
    login
    click_link('Settings')
    fill_in "Public email", with: "new@new.com"
    click_button("Update details")
    expect(page).to have_content("updated")
  end

end