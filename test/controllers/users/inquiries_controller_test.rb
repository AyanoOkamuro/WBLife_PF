require 'test_helper'

class Users::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_inquiries_index_url
    assert_response :success
  end

  test "should get confirm" do
    get users_inquiries_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get users_inquiries_thanks_url
    assert_response :success
  end

end
