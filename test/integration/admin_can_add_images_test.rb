require 'test_helper'

class AdminCanAddImagesTest < ActionDispatch::IntegrationTest
  test "admin can add images for users" do
    login_as_admin

    click_on "Images"

    assert page.has_content?("All images")

    click_on "Add Image"

    fill_in "Url", with: "http://learningwebappdev.com/lightbulb.png"

    click_on "Add image"

    assert page.has_content?("All images")

    assert page.has_css?(".image_list")
  end

  def login_as_admin
    default = Role.create(role: "default")
    admin = Role.create(role: "admin")

    user = User.new(username: "Bobby",
                       password: "password")
    user.role = admin
    user.save
    visit login_path

    fill_in "Username", with: "Bobby"
    fill_in "Password", with: "password"

    click_button "Login"
  end
end
