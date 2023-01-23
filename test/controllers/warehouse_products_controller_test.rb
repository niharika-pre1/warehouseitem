require "test_helper"

class WarehouseProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get warehouse_products_index_url
    assert_response :success
  end
end
