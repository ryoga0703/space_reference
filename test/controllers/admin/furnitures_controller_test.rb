require "test_helper"

class Admin::FurnituresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_furnitures_show_url
    assert_response :success
  end
end
