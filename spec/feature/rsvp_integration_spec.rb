# location: spec/feature/rsvp_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a rsvp', type: :feature do
  scenario 'valid input: attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp

    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Check page for created event
    visit rsvps_path
    expect(page).to have_content('1')
    expect(page).to have_content('true')
  end

  scenario 'valid input: not attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp

    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    fill_in 'Reason', with: 'Reason Test'
    click_on 'Create Rsvp'

    # Check page for created event
    visit rsvps_path
    expect(page).to have_content('1')
    expect(page).to have_content('Reason Test')
  end

  scenario 'invalid input: not attending and no reason' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp

    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    click_on 'Create Rsvp'

    # Check for errors
    expect(page).to have_content('Reason can\'t be blank')
  end
end