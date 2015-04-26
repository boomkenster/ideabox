require 'rails_helper'

RSpec.describe 'Ideas can brought to life' do
 context 'with valid attributes' do

      let(:dav) do 
      User.create(username: "dav",
                  password: "password",
                  )
      end

  it 'can brought to life' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(dav)
    visit new_idea_path

    fill_in "idea[name]", with: "Light"
    fill_in "idea[description]", with: "it's dark"

    click_link_or_button "Create Idea"

    expect(page).to have_content("Light")
    expect(page).to have_content("it's dark")
  end
 end 
end