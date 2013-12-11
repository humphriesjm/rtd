require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get registration" do
    get :registration
    assert_response :success
  end

  test "should get social" do
    get :social
    assert_response :success
  end

  test "should get press" do
    get :press
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
