require "test_helper"

class ShopkeepersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopkeepers_index_url
    assert_response :success
  end
end
