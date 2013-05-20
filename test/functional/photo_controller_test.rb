require 'test_helper'

class PhotoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get register_process" do
    get :register_process
    assert_response :success
  end

  test "should get del" do
    get :del
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
