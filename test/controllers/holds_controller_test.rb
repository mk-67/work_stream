require 'test_helper'

class HoldsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get holds_index_url
    assert_response :success
  end

end
