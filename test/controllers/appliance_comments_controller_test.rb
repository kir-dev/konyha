require 'test_helper'

class ApplianceCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appliance_comment = appliance_comments(:one)
  end

  test "should get index" do
    get appliance_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_appliance_comment_url
    assert_response :success
  end

  test "should create appliance_comment" do
    assert_difference('ApplianceComment.count') do
      post appliance_comments_url, params: { appliance_comment: { appliance_id: @appliance_comment.appliance_id, body: @appliance_comment.body, category: @appliance_comment.category } }
    end

    assert_redirected_to appliance_comment_url(ApplianceComment.last)
  end

  test "should show appliance_comment" do
    get appliance_comment_url(@appliance_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appliance_comment_url(@appliance_comment)
    assert_response :success
  end

  test "should update appliance_comment" do
    patch appliance_comment_url(@appliance_comment), params: { appliance_comment: { appliance_id: @appliance_comment.appliance_id, body: @appliance_comment.body, category: @appliance_comment.category } }
    assert_redirected_to appliance_comment_url(@appliance_comment)
  end

  test "should destroy appliance_comment" do
    assert_difference('ApplianceComment.count', -1) do
      delete appliance_comment_url(@appliance_comment)
    end

    assert_redirected_to appliance_comments_url
  end
end
