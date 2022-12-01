require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get admin_login" do
    get records_admin_login_url
    assert_response :success
  end

  test "should get customer_login" do
    get records_customer_login_url
    assert_response :success
  end
end
