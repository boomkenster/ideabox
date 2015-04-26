require 'rails_helper'

RSpec.describe 'admin can create images' do
  context 'with valid attributes' do
    let(:admin) do
      User.create(
                  username: "bob",
                  password: "password",
                  role: 1)
    end

    it 'can create images'  do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_images_path
      click_button "Create Image"
      visit new_admin_image_path
      fill_in "image[picture]", with: "img"
      click_button "Create Image"
      expect(page).to have_content("img")
    end
  end
end