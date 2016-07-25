require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "existing user can login" do
    skip
    login_user

    assert page.has_content?("Hello, Clarence")
    assert page.has_content?("Logout")
  end

  test "guest cannot login" do
    skip
    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Invalid. Try Again.")
    assert page.has_content?("Sign-in")
  end

  test "registered user cannot login with wrong password" do
    skip
    user = User.create(username: "Clarence",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "notmypassword"
    click_button "Login"

    assert page.has_content?("Invalid. Try Again.")
    assert page.has_content?("Sign-in")
  end

  test "authenticated user can logout" do
    skip
    login_user

    assert page.has_content?("Hello, Clarence")

    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Sign-in")
  end

  def login_user
    User.create(username: "Clarence",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end
end
