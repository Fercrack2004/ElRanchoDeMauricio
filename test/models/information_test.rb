require "test_helper"

class InformationTest < ActiveSupport::TestCase
  
  test "no es válido sin título" do
    info = Information.new(
      title: nil,
      info_type: "tipo",
      description: "lolol"
    )
    assert_not info.valid?
    assert_includes info.errors[:title], "can't be blank"
  end

    test "no es válido sin info_type" do
    info = Information.new(
      title: "holaquetal",
      info_type: nil,
      description: "lolol"
    )
    assert_not info.valid?
    assert_includes info.errors[:info_type], "can't be blank"
  end
    test "no es válido sin descripción" do
    info = Information.new(
      title: "holaignacio",
      info_type: "lolol",
      description: nil
    )
    assert_not info.valid?
    assert_includes info.errors[:description], "can't be blank"
  end
end
