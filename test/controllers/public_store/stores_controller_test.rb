require "test_helper"

class PublicStore::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_store_stores_index_url
    assert_response :success
  end

  test "should get show" do
    get public_store_stores_show_url
    assert_response :success
  end
end
