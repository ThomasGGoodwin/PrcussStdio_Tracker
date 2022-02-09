require "application_system_test_case"

class SignInsTest < ApplicationSystemTestCase
  setup do
    @sign_in = sign_ins(:one)
  end

  test "visiting the index" do
    visit sign_ins_url
    assert_selector "h1", text: "Sign Ins"
  end

  test "creating a Sign in" do
    visit sign_ins_url
    click_on "New Sign In"

    fill_in "Event", with: @sign_in.event_id
    fill_in "Signin time", with: @sign_in.signin_time
    fill_in "User", with: @sign_in.user_id
    click_on "Create Sign in"

    assert_text "Sign in was successfully created"
    click_on "Back"
  end

  test "updating a Sign in" do
    visit sign_ins_url
    click_on "Edit", match: :first

    fill_in "Event", with: @sign_in.event_id
    fill_in "Signin time", with: @sign_in.signin_time
    fill_in "User", with: @sign_in.user_id
    click_on "Update Sign in"

    assert_text "Sign in was successfully updated"
    click_on "Back"
  end

  test "destroying a Sign in" do
    visit sign_ins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sign in was successfully destroyed"
  end
end
