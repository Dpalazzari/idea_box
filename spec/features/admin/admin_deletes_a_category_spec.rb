require 'rails_helper'

describe "Admin deletes a category" do
  it "is permanently deleted" do
    admin = User.create!(name: 'Drew', email: "drew@drew.com", password: "boom", role: 1)
    category = Category.create!(name: 'blarg')

    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)

    visit admin_categories_path

    click_on 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content('blarg successfully destroyed.')
  end
end
