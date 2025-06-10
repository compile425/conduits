require "test_helper"

class ConduitsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get conduits_home_url
    assert_response :success
  end
end
