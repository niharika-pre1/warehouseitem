require "test_helper"

class ShopkeeperProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopkeeper_products_index_url
    assert_response :success
  end
end
