require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @chat = chat_rooms(:one)
  end

  test "no es valido sin contenido" do
      message = Message.new(
      content: nil,
      user: @user,
      chat_room: @chat_room
    )
    assert_not message.valid?
    assert_includes message.errors[:content], "can't be blank"
  end

  test "no es válido sin user_id" do
    message = Message.new(
      content: "lol",
      user: nil,
      chat_room: @chat_room
    )
    assert_not message.valid?
    assert_includes message.errors[:user], "must exist"
  end

  test "no es válido sin chat_room_id" do
    message = Message.new(
      content: "lol",
      user: @user,
      chat_room: nil
    )
    assert_not message.valid?
    assert_includes message.errors[:chat_room], "must exist"
  end
end
