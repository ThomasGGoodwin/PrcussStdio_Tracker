# location: spec/feature/oauth_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Google OAuth Signin', type: :feature do
  scenario 'valid inputs' do
    # visit new_admin_session_url
    visit '/admins/auth/google_oauth2'
    click_on 'avalos672918@tamu.edu'
    visit root_url
    expect(page).to have_content('Successfully authenticated from Google account.')
  end
end
