require 'test_helper'

class UserCanBeCreatedTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    skip
    visit new_user_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Hello, Clarence")
  end
end
