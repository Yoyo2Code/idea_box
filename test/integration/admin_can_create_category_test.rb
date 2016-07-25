require 'test_helper'

class AdminCanCreateCategoryTest < ActionDispatch::IntegrationTest
  test "admin can create a category" do
    login_as_admin

    assert page.has_content?("Categories")
    assert page.has_content?("Images")

    click_on "Categories"

    click_on "Create new category"

    fill_in "Category name", with: "Comedy"
    click_on "Create Category"

    assert page.has_content?("All categories")
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
