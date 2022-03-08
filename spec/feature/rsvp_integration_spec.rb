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

RSpec.describe 'Updating an rsvp', type: :feature do
  scenario 'successful: attend to not' do
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

    # Check for edit
    visit rsvps_path
    expect(page).to have_content('false')
    expect(page).to have_content('Reason Test')
  end

  scenario 'successful: not to attend' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    fill_in 'Reason', with: 'Reason Test'
    click_on 'Create Rsvp'

    # Edit rsvp
    visit rsvps_path
    click_on 'Edit'
    check('rsvp_attending', allow_label_click: true)
    fill_in 'Reason', with: ''
    click_on 'Update Rsvp'

    # Check for edit
    visit rsvps_path
    expect(page).to have_content('true')
  end

  scenario 'failure: attend to not' do
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

    # Should not change object
    visit rsvps_path
    expect(page).to have_content('true')
  end
end

RSpec.describe 'Deleting an rsvp', type: :feature do
  scenario 'successful: attend to not' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => { :user_id => 1, :event_id => 1, :rsvp_time => '2022-02-17 17:20:19' })
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Delete rsvp
    visit rsvps_path
    click_on 'Destroy'

    # Check for existence
    visit rsvps_path
    expect(page).to have_no_content('true')
  end
end

RSpec.describe 'RSVP button toggle', type: :feature do
  scenario 'has not rsvp\'d' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    #create new event_type
    visit new_event_type_path
    fill_in 'Description', with: 'EventTypeTest'
    click_on 'Create Event type'

    # Create new event
    visit new_event_path
    select 'EventTypeTest', :from => 'event_event_type_id'
    fill_in 'Name', with: 'EventTest'
    select '2022', :from => 'event_start_time_1i'
    select 'February', :from => 'event_start_time_2i'
    select '17', :from => 'event_start_time_3i'
    select '20', :from => 'event_start_time_4i'
    select '19', :from => 'event_start_time_5i'
    select '2023', :from => 'event_end_time_1i'
    select 'April', :from => 'event_end_time_2i'
    select '14', :from => 'event_end_time_3i'
    select '01', :from => 'event_end_time_4i'
    select '00', :from => 'event_end_time_5i'
    fill_in 'Location', with: 'LocationTest'
    fill_in 'Description', with: 'DescriptionTest'
    click_on 'Create Event'

    # Check event for rsvp button
    visit events_path
    expect(page).to have_content('RSVP')
    expect(page).to have_no_content('Change Status')
  end

  scenario 'has rsvp\'d' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    #create new event_type
    visit new_event_type_path
    fill_in 'Description', with: 'EventTypeTest'
    click_on 'Create Event type'

    # Create new event
    visit new_event_path
    select 'EventTypeTest', :from => 'event_event_type_id'
    fill_in 'Name', with: 'EventTest'
    select '2022', :from => 'event_start_time_1i'
    select 'February', :from => 'event_start_time_2i'
    select '17', :from => 'event_start_time_3i'
    select '20', :from => 'event_start_time_4i'
    select '19', :from => 'event_start_time_5i'
    select '2023', :from => 'event_end_time_1i'
    select 'April', :from => 'event_end_time_2i'
    select '14', :from => 'event_end_time_3i'
    select '01', :from => 'event_end_time_4i'
    select '00', :from => 'event_end_time_5i'
    fill_in 'Location', with: 'LocationTest'
    fill_in 'Description', with: 'DescriptionTest'
    click_on 'Create Event'

    # RSVP
    visit events_path
    click_on 'RSVP'
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Check event for rsvp button
    visit events_path
    expect(page).to have_content('Change Status')
    expect(page).to have_no_content('RSVP')
  end
end