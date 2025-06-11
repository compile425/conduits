require "test_helper"

class ConduitsControllerTest < ActionDispatch::IntegrationTest
  test "should get home via root" do
    get root_url
    assert_response :success
  end
end
