# # location: spec/feature/oauth_integration_spec.rb
# require 'rails_helper'

# RSpec.describe 'Sign In', type: :feature do
#     scenario 'valid admin' do
#         visit '/admins/auth/google_oauth2'

#         visit root_url
#         expect(page).to have_content('Welcome, admin')
#     end

#     scenario 'valid member' do
#         # Login to Google
#         visit '/admins/auth/google_oauth2'
      
#         # Check page for member login
#         visit root_url
#         expect(page).to have_content('Welcome, member')
#     end
  
#     scenario 'invalid admin/member' do
#     # Login to Google
#     visit '/admins/auth/google_oauth2'
    
#     # Check page for non admin/member login
#     visit root_url
#     expect(page).to have_content('You are not a members')
#     end
# end