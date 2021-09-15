require 'test_helper'

class Users::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_questions_new_url
    assert_response :success
  end

  test "should get create" do
    get users_questions_create_url
    assert_response :success
  end

  test "should get show" do
    get users_questions_show_url
    assert_response :success
  end

  test "should get index" do
    get users_questions_index_url
    assert_response :success
  end

  test "should get edit" do
    get users_questions_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_questions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_questions_destroy_url
    assert_response :success
  end

end
