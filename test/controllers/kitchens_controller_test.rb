require 'test_helper'

class KitchensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kitchen = kitchens(:one)
  end

  test "should get index" do
    get kitchens_url
    assert_response :success
  end

  test "should get new" do
    get new_kitchen_url
    assert_response :success
  end

  test "should create kitchen" do
    assert_difference('Kitchen.count') do
      post kitchens_url, params: { kitchen: { floor: @kitchen.floor } }
    end

    assert_redirected_to kitchen_url(Kitchen.last)
  end

  test "should show kitchen" do
    get kitchen_url(@kitchen)
    assert_response :success
  end

  test "should get edit" do
    get edit_kitchen_url(@kitchen)
    assert_response :success
  end

  test "should update kitchen" do
    patch kitchen_url(@kitchen), params: { kitchen: { floor: @kitchen.floor } }
    assert_redirected_to kitchen_url(@kitchen)
  end

  test "should destroy kitchen" do
    assert_difference('Kitchen.count', -1) do
      delete kitchen_url(@kitchen)
    end

    assert_redirected_to kitchens_url
  end
end
