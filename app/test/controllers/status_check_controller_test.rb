require 'test_helper'

class StatusCheckControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get status_check_index_url
    assert_response :success
  end

end
