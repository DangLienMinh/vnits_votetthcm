require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get introduce" do
    get :introduce
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get setting" do
    get :setting
    assert_response :success
  end

end
