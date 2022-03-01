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

RSpec.describe 'Editing a rsvp', type: :feature do
  scenario 'valid: changing rsvp to not attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Edit rsvp
    visit rsvps_path
    click_on 'Edit'
    uncheck('rsvp_attending', allow_label_click: true)
    fill_in 'Reason', with: 'Reason Test'
    click_on 'Update Rsvp'

    # Check page for edited event
    visit rsvps_path
    expect(page).to have_content('false')
    expect(page).to have_content('Reason Test')
  end

  scenario 'valid: changing rsvp to attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    fill_in 'Reason', with: 'bc'
    click_on 'Create Rsvp'

    # Edit rsvp
    visit rsvps_path
    click_on 'Edit'
    check('rsvp_attending', allow_label_click: true)
    click_on 'Update Rsvp'

    # Check page for edited event
    visit rsvps_path
    expect(page).to have_content('true')
    expect(page).to have_content('bc')
  end

  scenario 'invalid: changing rsvp to not attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Edit rsvp
    visit rsvps_path
    click_on 'Edit'
    uncheck('rsvp_attending', allow_label_click: true)
    click_on 'Update Rsvp'

    # Check for errors
    expect(page).to have_content('Reason can\'t be blank')
  end
end

RSpec.describe 'Deleting an rsvp', type: :feature do
  scenario 'valid inputs' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => { :user_id => 1234567890, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Delete new rsvp
    visit rsvps_path
    click_on 'Destroy'

    # Check page for created rsvp
    expect(page).to have_no_content('1234567890')
  end
end