# location: spec/feature/storage_keys_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a storage key', type: :feature do
  scenario 'valid inputs' do
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

    # Create new storage key
    visit new_storage_key_path
    select 'Cristian Avalos', :from => 'storage_key_user_id'
    click_on 'Create Storage key'

    # Check page storage key page for new key
    visit storage_keys_path
    expect(page).to have_content('Cristian Avalos')
  end
end

RSpec.describe 'Editing a storage key', type: :feature do

  scenario 'valid inputs' do
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

    # Create new storage key
    visit new_storage_key_path
    select 'Cristian Avalos', :from => 'storage_key_user_id'
    click_on 'Create Storage key'

    # Create Second User
    visit new_user_path
    fill_in 'First name', with: 'Luke'
    fill_in 'Last name', with: 'Yocum'
    fill_in 'Email', with: 'yocuml19@tamu.edu'
    select 'Admin', :from => 'user_role_id'
    click_on 'Create User'
    visit root_url

    # Edit new storage key
    visit storage_keys_path
    click_on 'Edit'
    select 'Luke Yocum', :from => 'storage_key_user_id'
    click_on 'Update Storage key'

    # Check page for created storage key
    visit storage_keys_path
    expect(page).to have_content('Luke Yocum')
  end
end

RSpec.describe 'Deleting a storage key', type: :feature do
  scenario 'valid inputs' do
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

   # Create new storage key
   visit new_storage_key_path
   select 'Cristian Avalos', :from => 'storage_key_user_id'
   click_on 'Create Storage key'

    # Delete new event
    visit storage_keys_path
    click_on 'Destroy'

    # Check page for created event
    expect(page).to have_no_content('Cristian Avalos')
  end
end