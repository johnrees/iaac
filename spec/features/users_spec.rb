require 'rails_helper'

RSpec.describe User, :type => :feature do

  let(:user) { create(:user) }

  it "can open invite" do
    user.send_invitation
    visit invite_url(invitation_code: user.invitation_code)
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    click_button "Update details"
    expect(page).to have_content('updated successfully')
    visit invite_url(invitation_code: user.invitation_code)
    expect(page).to have_content("User not found")
  end

  it "has not found for invites" do
    user.send_invitation
    visit invite_url(invitation_code: '123')
    expect(page).to have_content('User not found')
  end

  it "can create user" do
    visit signup_path
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Rees"
    fill_in "Public email", with: "john@bitsushi.com"
    fill_in "Password", with: "c00lpassword"
    fill_in "Password confirmation", with: "c00lpassword"
    click_button "Sign Up"
    expect(page).to have_content("created")
    expect(page).to have_link("Log Out")
  end

  it "can logout" do
    login
    click_link('Log Out')
    expect(page).to have_button('Log In')
  end

  it "cannot login with incorrect credentials" do
    visit login_path
    fill_in "Email", with: 'blargh'
    fill_in "Password", with: 'wrong'
    click_button "Log In"
    expect(page).to have_content('invalid')
  end

  it "can edit profile" do
    login
    click_link('Settings')
    fill_in "Public email", with: "new@new.com"
    click_button("Update details")
    expect(page).to have_content("updated")
  end

  skip "can register"

  it "lists all users" do
    login
    eric = create(:user, first_name: 'Eric', last_name: 'Cartman')
    course = create(:course)
    course.students << eric
    mr = create(:user, first_name: 'Mr', last_name: 'Garrison')
    course.tutors << mr
    create(:user, first_name: 'Randy', last_name: 'Marsh')
    visit users_path

    expect(page).to have_content('Students')
    expect(page).to have_link('Eric Cartman')
    expect(page).to have_content('Tutors')
    expect(page).to have_link('Mr Garrison')

    expect(page).to_not have_link('Randy Marsh')
  end

  it "has not_authorised action" do
    course = create(:course)
    login
    visit course_path(course)
    expect(page).to have_content("not authorized")
  end

end