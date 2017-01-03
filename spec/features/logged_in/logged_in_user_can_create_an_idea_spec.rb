require 'rails_helper'

describe "Logged in User" do
  it "creates a new idea" do
    user = User.create(name: "Drew", email: 'drew@drew.com', password: 'password')
    category = Category.create!(name: "Creative")
    visit login_path

    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    click_on "New Idea"

    within("form") do
      fill_in "idea[name]", with: "my new idea"
      fill_in "idea[description]", with: "I'm going to make an app!"
      select "Creative", from: 'idea[category_id]'
      click_on 'Create'
    end

    expect(current_path).to eq(user_path(user.id))
    expect(page).to have_link("my new idea")
  end
end
