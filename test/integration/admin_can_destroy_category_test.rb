require 'test_helper'

class AdminCanDestroyCategoryTest < ActionDispatch::IntegrationTest
  test "admin can create a category" do
    login_as_admin

    action = Category.create(category_name: "Action")

    assert page.has_content?("Categories")
    assert page.has_content?("Images")

    click_on "Categories"

    assert page.has_content?(action.category_name)

    click_on "Delete category"

    refute page.has_content?(action.category_name)
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
