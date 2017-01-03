require 'rails_helper'

describe "User creates an idea" do
  it "user edits the idea" do
    user     = User.create!(name: "Drew", email: 'drew@drew.com', password: 'password')
    category = Category.create!(name: "Creative")
    idea     = user.ideas.create!(name:"example", description: "does things", category_id: category.id)

    visit user_idea_path(user, idea)

    click_on "example"

    click_on "Edit"

    within("form") do
      fill_in "idea[name]", with: "Example 2"
      click_on "Edit"
    end


    expect(current_path).to eq(user_idea_path(user, idea))
    expect(page).to have_content("Example 2")
    expect(page).to have_content("does things")
  end
end
