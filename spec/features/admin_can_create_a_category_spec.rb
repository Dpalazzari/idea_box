require 'rails_helper'

describe "Admin creates a new category" do
  it "visits new category form" do
    admin = User.create!(name: 'Drew', email: "drew@drew.com", password: "boom", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)

    visit new_admin_category_path

    fill_in "category[name]", with: 'Personal'
    click_on 'Create'

    expect(Category.last.name).to eq('Personal')
  end
end
