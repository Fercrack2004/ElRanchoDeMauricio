require "test_helper"

class RequestTest < ActiveSupport::TestCase
  def setup
    @user = users(:one) 
  end

  test "no es valido sin un requestable" do 
    request = Request.new(
      user: @user,
      requestable: nil,
      state: "pending"
      
    )
    assert_not request.valid?
    assert_includes request.errors[:requestable], "can't be blank"
  end
end
