require 'rails_helper'

RSpec.describe "admin can create categories" do
  context "with admin logged in" do
    let(:admin) do
      User.create(
                  username: "bob",
                  password: "password",
                  role: 1
                  )
    end

    it "can destroy a catagory" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path
      click_button "Create New Category"
      visit new_admin_category_path
      fill_in "category[name]", with: "booya"
      click_button "Create Category"
      expect(page).to have_content("booya")

      click_button "Remove"
      expect(page).to_not have_content("booya")
    end
  end
end