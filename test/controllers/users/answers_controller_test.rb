require 'test_helper'

class Users::AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_answers_edit_url
    assert_response :success
  end

end
