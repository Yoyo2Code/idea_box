require 'test_helper'

class AdminCanDeleteImageTest < ActionDispatch::IntegrationTest
  test "only admin can delete image" do
    login_as_admin

    url = "http://learningwebappdev.com/lightbulb.png"
    image = Image.create(url: url)

    click_on "Images"

    assert page.has_css?(".image")
    assert page.has_content?(url)

    click_on "Delete image"

    assert page.has_content?("All images")

    refute page.has_content?(url)
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
