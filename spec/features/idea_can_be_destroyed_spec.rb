require 'rails_helper'

RSpec.describe 'idea can be destroyed' do
  context 'click and destroy' do

    let(:dav) do 
      User.create(username: "dav",
                  password: "password")
    end

    it 'can be deleted' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dav)
        visit new_idea_path

      fill_in "idea[name]", with: "table"
      fill_in "idea[description]", with: "to put stuff on"

      click_link_or_button "Create Idea"
      
      expect(page).to have_content("table")

      click_link_or_button "Remove Bad Idea"

      expect(page).to_not have_content("table")
    end
    
  end
end