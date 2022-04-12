# location: spec/feature/instrument_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an instrument', type: :feature do
  scenario 'valid inputs' do
    # Login to Google
    admin_user
    visit '/admins/auth/google_oauth2'

    # Create instrument
    visit new_instrument_path
    fill_in 'Name', with: 'instrument'
    click_on 'Create Instrument'

    # Check page for created instrument
    visit instruments_path
    expect(page).to have_content('instrument')
  end

  scenario 'invalid inputs' do
    # Login to Google
    admin_user
    visit '/admins/auth/google_oauth2'

    # Create instrument
    visit new_instrument_path
    click_on 'Create Instrument'

    # Check page for errors
    expect(page).to have_content("Name can\'t be blank")
  end
end

RSpec.describe 'Editing an instrument', type: :feature do

  before do
    Instrument.create(name: 'drum')
  end
    
  scenario 'valid inputs' do
    # Login to Google
    admin_user
    visit '/admins/auth/google_oauth2'
    
    # Edit instrument

    visit instruments_path
    click_on 'Edit'
    fill_in 'Name', with: 'bucket'
    click_on 'Update Instrument'

    # Check for edited instrument
    visit instruments_path
    expect(page).to have_content('bucket')
    expect(page).to have_no_content('drum')
    
  end

  scenario 'empty inputs' do
    # Login to Google
    admin_user
    visit '/admins/auth/google_oauth2'

    # Edit instrument
    visit instruments_path
    click_on 'Edit'
    fill_in 'Name', with: ''
    click_on 'Update Instrument'

    # Check for error messages
    expect(page).to have_content('Name can\'t be blank')

    # Check page for verify no change
    visit instruments_path
    expect(page).to have_content('drum')
  end
end

RSpec.describe 'Deleting an instrument', type: :feature do

  before do
    Instrument.create(name: 'drum')
  end
    
  scenario 'valid inputs' do
    # Login to Google
    visit '/admins/auth/google_oauth2'

    # Delete instrument
    visit instruments_path
    click_on 'Destroy'

    # Verify deletion
    expect(page).to have_no_content('drum')
  end
end