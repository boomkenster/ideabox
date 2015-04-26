require 'rails_helper'

RSpec.describe 'Someone can create a new user' do
  context 'with valid attributes' do
    it 'can create a new user' do
      visit new_user_path

      fill_in "user[username]", with: "David"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_link_or_button "Create User"

      expect(page).to have_content("Hello, David")
    end
  end
end