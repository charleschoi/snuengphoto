require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get login_process" do
    get :login_process
    assert_response :success
  end

  test "should get find_pw_send" do
    get :find_pw_send
    assert_response :success
  end

  test "should get reset_pw" do
    get :reset_pw
    assert_response :success
  end

end
