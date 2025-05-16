require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) 
    @reviewable = blogs(:one) 
  end

  test "el puntaje debe estar dentro de los rangos permitidos" do 
    review = Review.new(
      user: @user,
      reviewable: @reviewable,
      content: "Pésimo",
      score: 0  
    )
    assert_not review.valid?
    assert_includes review.errors[:score], "must be greater than or equal to 1.0"
  end

  test "debe tener user" do 
    review = Review.new(
      user: nil,
      reviewable: @reviewable,
      content: "Pésimo",
      score: 0  
    )
    assert_not review.valid?
    assert_includes review.errors[:user], "can't be blank"
  end

  test "debe tener reviewable" do 
    review = Review.new(
      user: @user,
      reviewable: nil,
      content: "Pésimo",
      score: 0  
    )
    assert_not review.valid?
    assert_includes review.errors[:reviewable], "can't be blank"
  end

  test "debe tener contenido" do 
    review = Review.new(
      user: @user,
      reviewable: @reviewable,
      content: nil,
      score: 0  
    )
    assert_not review.valid?
    assert_includes review.errors[:content], "can't be blank"
  end

end
