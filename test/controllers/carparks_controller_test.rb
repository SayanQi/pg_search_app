require "test_helper"

class CarparksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carparks_index_url
    assert_response :success
  end

  test "should get show" do
    get carparks_show_url
    assert_response :success
  end

  test "should get new" do
    get carparks_new_url
    assert_response :success
  end

  test "should get edit" do
    get carparks_edit_url
    assert_response :success
  end
end
