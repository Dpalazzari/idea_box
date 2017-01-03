require 'rails_helper'

describe "User visits a new user page" do
  it "they can create a new user" do

    visit new_user_path

    fill_in "user[name]", with: "Drew"
    fill_in "user[email]", with: "drew@drew.com"
    fill_in "user[password]", with: "password"
    click_on "Create Account"

    expect(current_path).to eq('/login')
    expect(page).to have_content("Successfully created account")
  end
end
