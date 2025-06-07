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

  test "no es valido sin un user" do 
    blog = blogs(:one)
    request = Request.new(
      user: nil,
      requestable: blog,
      state: "pending"
      
    )
    assert_not request.valid?
    assert_includes request.errors[:user], "must exist"
  end

  test "no es valido sin un state valido " do 
    blog = blogs(:one)
    assert_raises ArgumentError do 
    request = Request.new(
      user: @user,
      requestable: blog,
      state: 3
    )
    end

  end
end
