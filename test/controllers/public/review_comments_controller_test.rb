require "test_helper"

class Public::ReviewCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_review_comments_index_url
    assert_response :success
  end
end
