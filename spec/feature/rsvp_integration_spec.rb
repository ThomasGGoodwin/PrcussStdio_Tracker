# location: spec/feature/rsvp_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a rsvp', type: :feature do
  
  before do
    EventType.create(id: 1, description: 'Test')
    @event = Event.create(event_type_id: 1, name: 'EventTest', start_time: '2050-02-17 01:01:00', end_time: '2050-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    Instrument.create(id: 1, name: 'Snare') 
    Instrument.create(id: 2, name: 'Quads')
  end

  scenario 'valid input: attending' do
    # Login to Google
    admin_user
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
    check('Quads', allow_label_click: true)
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Check page for created event
    visit rsvps_path
    expect(page).to have_content('email1@tamu.edu')
    expect(page).to have_content('EventTest')
    expect(page).to have_content('Snare')
    expect(page).to have_content('Quads')
    expect(page).to have_content('true')
  end

  scenario 'valid input: not attending' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
    fill_in 'Reason', with: 'Reason Test'
    click_on 'Create Rsvp'

    # Check page for created event
    visit rsvps_path
    expect(page).to have_content('email1@tamu.edu')
    expect(page).to have_content('EventTest')
    expect(page).to have_content('Snare')
    expect(page).to have_content('false')
    expect(page).to have_content('Reason Test')
  end

  scenario 'valid input: shows full name, not email' do
    # Create user
    Role.create(id: 1, role_description: 'Member')
    @user = User.create(first_name: 'First', last_name: 'Last', email: 'test@tamu.edu', role_id: 1)

    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Create new rsvp
    visit new_rsvp_path(:rsvp => {:user_id => @user.email, :event_id => @event.id, :rsvp_time => "2022-02-17 20:19:00"})
    check('Snare', allow_label_click: true)
    fill_in 'Reason', with: 'Reason Test'
    click_on 'Create Rsvp'

    # Check page for created event
    visit rsvps_path
    expect(page).to have_content('Last, First')
    expect(page).to have_no_content('test@tamu.edu')
  end

  scenario 'invalid input: missing attributes' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
    click_on 'Create Rsvp'

    # Check for errors
    expect(page).to have_content('Reason can\'t be blank')
  end
end

RSpec.describe 'Updating an rsvp', type: :feature do

  before do
    EventType.create(id: 1, description: 'Test')
    Event.create(event_type_id: 1, name: 'EventTest', start_time: '2050-02-17 01:01:00', end_time: '2050-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    Instrument.create(name: 'Snare') 
    Instrument.create(name: 'Quads')
  end

  scenario 'successful: attend to not' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
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

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
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
    expect(page).to have_no_content('Reason Test')
  end

  scenario 'failure: attend to not' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
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

  before do
    EventType.create(id: 1, description: 'Test')
    Event.create(event_type_id: 1, name: 'EventTest', start_time: '2050-02-17 01:01:00', end_time: '2050-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    Instrument.create(name: 'Snare') 
    Instrument.create(name: 'Quads')
  end

  scenario 'successful: attend to not' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
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

    # Create new event_type
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

  scenario 'has rsvp\'d and attending' do
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
    expect(page).to have_content('Change Status: Attending')
    expect(page).to have_no_content('RSVP')
  end

  scenario 'has rsvp\'d and not attending' do
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
    fill_in 'Reason', with: 'test'
    click_on 'Create Rsvp'

    # Check event for rsvp button
    visit events_path
    expect(page).to have_content('Change Status: Not Attending')
    expect(page).to have_no_content('RSVP')
  end
end

RSpec.describe 'Rsvps event is deleted', type: :feature do

  before do
    EventType.create(id: 1, description: 'Test')
    Event.create(event_type_id: 1, name: 'EventTest', start_time: '2050-02-17 01:01:00', end_time: '2050-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    Instrument.create(name: 'Snare') 
    Instrument.create(name: 'Quads')
  end

  scenario 'success' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Find event to RSVP
    visit events_path
    click_on 'RSVP'

    # Create new rsvp
    check('Snare', allow_label_click: true)
    check('rsvp_attending', allow_label_click: true)
    click_on 'Create Rsvp'

    # Delete event
    Event.where(name: 'EventTest').first.destroy

    # Check for empty name
    visit rsvps_path
    expect(page).to have_content('Event Not Found')
  end
end