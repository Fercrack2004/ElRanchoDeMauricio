require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "get index review" do
    user = users(:one)
    @blog = blogs(:one)
    sign_in user
    get blog_reviews_url(@blog)
    assert_response :success
  end
end
