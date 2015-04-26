require 'rails_helper'

RSpec.describe 'User can select category upon creation' do 

    context "with proper login" do
    let(:admin) do
      User.create(
                  username: "bob",
                  password: "password",
                  role: 1
                  )
    end

    let(:default_user) do 
      User.create(username: "joe",
                  password: "password",
                  role: 0
                  )
      end

    xit "saves and displays the category" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path
      click_button "Create New Category"
      visit new_admin_category_path
      fill_in "category[name]", with: "booya"
      click_button "Create Category"
      expect(page).to have_content("booya")


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
      visit new_idea_path
      fill_in "category[name]", with: "Bad Idea"
      select("booya", :from => "category")
      click_button "Create Idea"
      expect(page).to have_content("Bad Idea")
      expect(page).to have_content("booya")
    end
  end
end