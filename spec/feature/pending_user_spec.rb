# location: spec/feature/pending_user_spec.rb
require 'rails_helper'

RSpec.describe 'Pending User', type: :feature do
    scenario 'pending user' do
        # Login to Google
        admin_user
        visit '/admins/auth/google_oauth2'

        # Create Roles
        visit roles_path
        visit new_role_path
        fill_in 'Role description', with: 'Admin'
        click_on 'Create Role'

        visit root_url
        visit roles_path
        visit new_role_path
        fill_in 'Role description', with: 'Pending'
        click_on 'Create Role'

        # Create User
        visit root_url
        visit users_path
        visit new_user_path
        fill_in 'First name', with: 'Test'
        fill_in 'Last name', with: 'User1'
        fill_in 'Email', with: 'email1@gmail.com'
        select 'Admin', :from => 'user_role_id'
        click_on 'Create User'

        # Logout
        visit root_url
        destroy_admin_session_path

        # Login to Google
        nonmember_user
        visit '/admins/auth/google_oauth2'

        # Submit Pending User
        visit new_pending_path
        click_on 'Request'

        visit root_url
        expect(page).to have_content('You are not a member')

        # Logout
        visit root_url
        destroy_admin_session_path

        # Login to Google
        admin_user
        visit '/admins/auth/google_oauth2'

        visit users_path
        expect(page).to have_content('email2@tamu.edu')
    end
end
