require 'rails_helper'

describe "admin visits users index page" do
  context "admin" do
    it "allows admin to see all users" do
      admin = User.create!(name: 'Drew', email: "drew@drew.com", password: "boom", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(true)

      visit admin_users_path

      expect(page).to have_content("All Users")
    end
  end

  context "default user" do
    it "does not allow access to default user" do
      user = User.create!(name: 'Jesse', email: 'jesse@jesse.com', password: 'nrggghh', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(false)

      visit admin_users_path

      expect(page).to_not have_content("All Users")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
