require 'test_helper'

class FrontpageControllerTest < ActionController::TestCase
  test "should get enter_id" do
    get :enter_id
    assert_response :success
  end

end
