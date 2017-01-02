require 'rails_helper'

describe "Logged in user clicks 'Logout'" do
  it "they are successfully logged out" do
    user = User.create(name: "Drew", email: 'drew@drew.com', password: 'password')

    visit login_path

    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    click_on "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("See ya later!")
    expect(page).to have_content("Login")
  end
end
