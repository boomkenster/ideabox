require 'rails_helper'

RSpec.describe 'can be edited' do
 context 'with valid attributes' do

    let(:dav) do 
      User.create(username: "dav",
                  password: "password",
              )
      end

  it 'can be edited' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dav)

    visit new_idea_path
    fill_in "idea[name]", with: "table"
    fill_in "idea[description]", with: "to put stuff on"

    click_link_or_button "Create Idea"

    click_link_or_button "Edit"
    fill_in "idea[name]", with: "Light"
    fill_in "idea[description]", with: "it's dark"
    click_link_or_button "Update"

    expect(page).to have_content("Light")
    expect(page).to have_content("it's dark")
    expect(page).not_to have_content("table")
    expect(page).not_to have_content("put stuff on")
  end
 end 
end