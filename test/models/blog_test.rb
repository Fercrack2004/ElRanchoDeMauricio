require "test_helper"

class BlogTest < ActiveSupport::TestCase
  test "no es válido sin título" do
    blog = Blog.new(
      title: nil,
      public_type: "a",
      description: "b",
      cook_time: 10
    )
    assert_not blog.valid?
    assert_includes blog.errors[:title], "can't be blank"
  end

  test "no es válido sin public_type" do
    blog = Blog.new(
      title: "a",
      public_type: nil,
      description: "b",
      cook_time: 10
    )
    assert_not blog.valid?
    assert_includes blog.errors[:public_type], "can't be blank"
  end

  test "no es válido sin description" do
    blog = Blog.new(
      title: "a",
      public_type: "b",
      description: nil,
      cook_time: 10
    )
    assert_not blog.valid?
    assert_includes blog.errors[:description], "can't be blank"
  end

  test "no es válido sin cook_time" do
    blog = Blog.new(
      title: "a",
      public_type: "b",
      description: "c",
      cook_time: nil
    )
    assert_not blog.valid?
    assert_includes blog.errors[:cook_time], "can't be blank"
  end

  test "no es válido si cook_time no es int" do
    blog = Blog.new(
      title: "a",
      public_type: "b",
      description: "c",
      cook_time: "d"
    )
    assert_not blog.valid?
    assert_includes blog.errors[:cook_time], "is not a number"
  end

  
  test "no es válido con cook_time menor a 1" do
    blog = Blog.new(
      title: "a",
      public_type: "b",
      description: "c",
      cook_time: 0
    )
    assert_not blog.valid?
    assert_includes blog.errors[:cook_time], "must be greater than or equal to 1"
  end


end
