require 'rails_helper'

RSpec.describe "admin categories" do
  context "with admin logged in" do

    let(:admin) do 
      User.create(username: "tom",
                  password: "password",
                  role: 1)
    end

    it "displays the categories" do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("List of Categories")
    end
  end

  context "with default user logged in " do
    let(:default_user) do
      User.create(username: "bob",
                  password: "password",
                  role:0)
  end

  it "displays a 404" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit admin_categories_path

    expect(page).to have_content("The page you were looking for doesn't exist (404")  
  end
end
  
end