# location: spec/feature/events_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
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

    # Check page for created event
    visit events_path
    expect(page).to have_content('EventTypeTest')
    expect(page).to have_content('EventTest')
    expect(page).to have_content('2022-02-17 20:19:00')
    expect(page).to have_content('2023-04-14 01:00:00')
    expect(page).to have_content('LocationTest')
    expect(page).to have_content('DescriptionTest')
  end
end

RSpec.describe 'Editing an event', type: :feature do

  #let!(:event) { Event.create(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest') }

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

    #create new event_types
    visit new_event_type_path
    fill_in 'Description', with: 'EventTypeTest'
    click_on 'Create Event type'
    visit new_event_type_path
    fill_in 'Description', with: 'EventTypeTest2'
    click_on 'Create Event type'

    # Create new event
    visit new_event_path
    select 'EventTypeTest', :from => 'event_event_type_id'
    fill_in 'Name', with: 'EventTest'
    select '2022', :from => 'event_start_time_1i'
    select 'March', :from => 'event_start_time_2i'
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

    # Edit new event
    visit events_path
    click_on 'Edit'
    select 'EventTypeTest2', :from => 'event_event_type_id'
    fill_in 'Name', with: 'EventTest2'
    select '2023', :from => 'event_start_time_1i'
    select 'April', :from => 'event_start_time_2i'
    select '14', :from => 'event_start_time_3i'
    select '01', :from => 'event_start_time_4i'
    select '01', :from => 'event_start_time_5i'
    select '2021', :from => 'event_end_time_1i'
    select 'February', :from => 'event_end_time_2i'
    select '17', :from => 'event_end_time_3i'
    select '00', :from => 'event_end_time_4i'
    select '01', :from => 'event_end_time_5i'
    fill_in 'Location', with: 'LocationTest2'
    fill_in 'Description', with: 'DescriptionTest2'
    click_on 'Update Event'

    # Check page for created event
    visit events_path
    expect(page).to have_content('EventTypeTest2')
    expect(page).to have_content('EventTest2')
    expect(page).to have_content('2023-04-14 01:01:00')
    expect(page).to have_content('2021-02-17 00:01:00')
    expect(page).to have_content('LocationTest2')
    expect(page).to have_content('DescriptionTest2')
  end

  scenario 'empty inputs' do
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

     #create new event_types
     visit new_event_type_path
     fill_in 'Description', with: 'EventTypeTest'
     click_on 'Create Event type'
     visit new_event_type_path
     fill_in 'Description', with: 'EventTypeTest2'
     click_on 'Create Event type'
 
     # Create new event
     visit new_event_path
     select 'EventTypeTest', :from => 'event_event_type_id'
     fill_in 'Name', with: 'EventTest'
     select '2022', :from => 'event_start_time_1i'
     select 'March', :from => 'event_start_time_2i'
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

    # Edit new event
    visit events_path
    click_on 'Edit'
    fill_in 'Name', with: ''
    fill_in 'Location', with: ''
    fill_in 'Description', with: ''
    click_on 'Update Event'

    # Check for error messages
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Description can't be blank")
    

    # Check page for created event
    visit events_path
    expect(page).to have_content('EventTest')
    expect(page).to have_content('LocationTest')
    expect(page).to have_content('DescriptionTest')
  end
end

RSpec.describe 'Deleting an event', type: :feature do
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

    # Delete new event
    visit events_path
    click_on 'Destroy'

    # Check page for created event
    expect(page).to have_no_content('EventTest')
    expect(page).to have_no_content('LocationTest')
    expect(page).to have_no_content('DescriptionTest')
  end
end