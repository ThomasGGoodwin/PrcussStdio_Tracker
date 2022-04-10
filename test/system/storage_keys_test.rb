require "application_system_test_case"

class StorageKeysTest < ApplicationSystemTestCase
  setup do
    @storage_key = storage_keys(:one)
  end

  test "visiting the index" do
    visit storage_keys_url
    assert_selector "h1", text: "Storage Keys"
  end

  test "creating a Storage key" do
    visit storage_keys_url
    click_on "New Storage Key"

    fill_in "Storage key", with: @storage_key.storage_key_id
    fill_in "User", with: @storage_key.user_id
    click_on "Create Storage key"

    assert_text "Storage key was successfully created"
    click_on "Back"
  end

  test "updating a Storage key" do
    visit storage_keys_url
    click_on "Edit", match: :first

    fill_in "Storage key", with: @storage_key.storage_key_id
    fill_in "User", with: @storage_key.user_id
    click_on "Update Storage key"

    assert_text "Storage key was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage key" do
    visit storage_keys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage key was successfully destroyed"
  end
end
