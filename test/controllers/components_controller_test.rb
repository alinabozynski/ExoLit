require "test_helper"

class ComponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get header" do
    get components_header_url
    assert_response :success
  end

  test "should get footer" do
    get components_footer_url
    assert_response :success
  end
end
