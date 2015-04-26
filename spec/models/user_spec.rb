require 'rails_helper'

RSpec.describe User, type: :model do
 let(:dav) do 
   User.new(username: "Dav")  
 end 

 it 'can has ideas' do
  expect(dav).to respond_to(:ideas)
 end

 it 'fails to validate' do
  dav.username = nil
  expect(dav).not_to be_valid
 end
end
