# location: spec/feature/signin_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a signin', type: :feature do
  scenario 'valid input: attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new signin

    visit new_sign_in_path
    fill_in 'User', with: 1
    fill_in 'Event', with: 1
    select '2022', :from => 'sign_in_signin_time_1i'
    select 'February', :from => 'sign_in_signin_time_2i'
    select '17', :from => 'sign_in_signin_time_3i'
    select '20', :from => 'sign_in_signin_time_4i'
    select '19', :from => 'sign_in_signin_time_5i'
    check('sign_in_attending', allow_label_click: true)
    click_on 'Create Sign in'

    # Check page for created event
    visit sign_ins_path
    expect(page).to have_content('1')
    expect(page).to have_content('true')
  end

  scenario 'valid input: not attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new signin

    visit new_sign_in_path
    fill_in 'User', with: 1
    fill_in 'Event', with: 1
    select '2022', :from => 'sign_in_signin_time_1i'
    select 'February', :from => 'sign_in_signin_time_2i'
    select '17', :from => 'sign_in_signin_time_3i'
    select '20', :from => 'sign_in_signin_time_4i'
    select '19', :from => 'sign_in_signin_time_5i'
    fill_in 'Reason', with: 'Reason Test'
    click_on 'Create Sign in'

    # Check page for created event
    visit sign_ins_path
    expect(page).to have_content('1')
    expect(page).to have_content('Reason Test')
  end

  scenario 'invalid input: not attending and no reason' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new signin

    visit new_sign_in_path
    fill_in 'User', with: 1
    fill_in 'Event', with: 1
    select '2022', :from => 'sign_in_signin_time_1i'
    select 'February', :from => 'sign_in_signin_time_2i'
    select '17', :from => 'sign_in_signin_time_3i'
    select '20', :from => 'sign_in_signin_time_4i'
    select '19', :from => 'sign_in_signin_time_5i'
    click_on 'Create Sign in'

    # Check for errors
    expect(page).to have_content('Reason can\'t be blank')
  end
end