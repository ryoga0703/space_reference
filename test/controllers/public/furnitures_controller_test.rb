require "test_helper"

class Public::FurnituresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_furnitures_show_url
    assert_response :success
  end

  test "should get new" do
    get public_furnitures_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_furnitures_edit_url
    assert_response :success
  end
end
