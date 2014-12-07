require 'test_helper'

class AvatarControllerTest < ActionController::TestCase
  test "should get serve" do
    get :serve
    assert_response :success
  end

end
