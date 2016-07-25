require 'test_helper'

class UserCanCreateAnIdeaTest < ActionDispatch::IntegrationTest
  test "the truth" do
    skip
    login_user

    assert page.has_content?("Welcome, Clarence")

    fill_in "Title", with: "How to build a boat"
    fill_in "Body", with: "Just build it."

    click_on "Boat"
    click_on "Create Idea"

    assert page.has_content?("How to build a boat")
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
