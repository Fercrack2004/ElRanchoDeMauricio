require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "get index review" do
    user = users(:one)
    @blog = blogs(:one)
    sign_in user
    get blog_reviews_url(@blog)
    assert_response :success
  end

  test "new review" do
    user = users(:one)
    @blog = blogs(:one)
    sign_in user
    get new_blog_review_url(@blog)
    assert_response :success
  end

  test "show review" do
    user = users(:one)
    sign_in user

    information = Information.create!(
      title: "Test",
      info_type: "k",
      description: "Texto"
    )


    InformationParticipation.create!(
      user: user,
      information: information,
      contribution: "autor"  
    )


    review = Review.create!(
      score: 5,
      content: "ok",
      user: user,
      reviewable: information
    )

    get information_review_path(information, review)
    assert_response :success
  end



end
