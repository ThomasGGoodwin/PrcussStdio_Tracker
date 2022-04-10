# location: spec/feature/oauth_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Sign In', type: :feature do
    scenario 'valid admin' do
        # Login to Google
        visit '/admins/auth/google_oauth2'
        
        # Create Role
        visit roles_path
        visit new_role_path
        fill_in 'Role description', with: 'Admin'
        click_on 'Create Role'

        # Create User
        visit root_url
        visit users_path
        visit new_user_path
        fill_in 'First name', with: 'Cristian'
        fill_in 'Last name', with: 'Avalos'
        fill_in 'Email', with: 'avalos672918@tamu.edu'
        select 'Admin', :from => 'user_role_id'
        click_on 'Create User'

        visit root_url
        expect(page).to have_content('Percussion Studio - Admin')
    end

    scenario 'valid member' do
        # Login to Google
        visit '/admins/auth/google_oauth2'
      
        # Create Role
        visit roles_path
        visit new_role_path
        fill_in 'Role description', with: 'Member'
        click_on 'Create Role'

        # Create User
        visit root_url
        visit users_path
        visit new_user_path
        fill_in 'First name', with: 'Cristian'
        fill_in 'Last name', with: 'Avalos'
        fill_in 'Email', with: 'avalos672918@tamu.edu'
        select 'Member', :from => 'user_role_id'
        click_on 'Create User'

        # Check page for member login
        visit root_url
        expect(page).to have_content('Percussion Studio')
    end
  
    scenario 'invalid admin/member' do
    # Login to Google
    set_name("Non Member")
    visit '/admins/auth/google_oauth2'
    # Check page for non admin/member login    
    visit root_url
    expect(page).to have_content('You are not a member')
    set_name("Cristian Avalos")
    end
end