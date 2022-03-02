# location: spec/feature/attendance_report_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Viewing the report with a created User', type: :feature do
    
   # let(:test_user) { User.new(first_name: 'Nassef', last_name: 'Ameen', email: 'nameen1@tamu.edu', role: 1)}

   scenario 'valid inputs' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # create the test user
    visit new_user_path
    fill_in 'First name', with: 'Harry'
    fill_in 'Last name', with: 'Potter'
    fill_in 'Email', with: 'hp@hogwarts.edu'
    fill_in 'Role', with: 1
    click_on 'Create User'

    # visit attendance report page
    visit '/users/attendance_report'

    # check page to have test user information
    expect(page).to have_content('Harry')
    expect(page).to have_content('Potter')
    expect(page).to have_content(2)
    expect(page).to have_content('No')
   end
end