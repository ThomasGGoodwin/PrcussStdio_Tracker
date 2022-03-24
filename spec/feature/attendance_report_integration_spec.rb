# location: spec/feature/attendance_report_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Viewing the report with a created User', type: :feature do
    #let!(:user) { User.create(first_name: 'Nassef', last_name: 'Ameen', email: 'nameen1@tamu.edu', role: 1)}

   scenario 'valid inputs' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    #create the role for user
    visit new_role_path
    fill_in 'Role description', with: 'TestRole'
    click_on 'Create Role'

    # create the test user
    visit new_user_path
    fill_in 'First name', with: 'Harry'
    fill_in 'Last name', with: 'Potter'
    fill_in 'Email', with: 'hp@hogwarts.edu'
    select 'TestRole', :from => 'user_role_id'
    click_on 'Create User'

    # visit attendance report page
    visit attendance_report_path

    # check page to have test user information
    expect(page).to have_content('Harry')
    expect(page).to have_content('Potter')
    expect(page).to have_content(2)
    expect(page).to have_content('No')
   end

   scenario "empty inputs" do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    #create the role for user
    visit new_role_path
    fill_in 'Role description', with: 'TestRole'
    click_on 'Create Role'

    # create the test user
    visit new_user_path
    fill_in 'First name', with: 'Harry'
    fill_in 'Last name', with: 'Potter'
    fill_in 'Email', with: 'hp@hogwarts.edu'
    select 'TestRole', :from => 'user_role_id'
    click_on 'Create User'

    # Edit created user
    visit users_path
    click_on 'Edit'
    fill_in 'First name', with: ''
    fill_in 'Last name', with: ''
    fill_in 'Email', with: ''
    click_on 'Update User'

    # Check for error messages
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")

    # Check page for created User
    visit attendance_report_path
    expect(page).to have_content('Harry')
    expect(page).to have_content('Potter')
    expect(page).to have_content(2)
    expect(page).to have_content('No')
   end
end