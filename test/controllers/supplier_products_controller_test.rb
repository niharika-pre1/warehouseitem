require "test_helper"

class SupplierProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supplier_products_index_url
    assert_response :success
  end
end
