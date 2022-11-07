require "test_helper"

class Admin::ReviewCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_review_comments_index_url
    assert_response :success
  end
end
