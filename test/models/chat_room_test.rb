require "test_helper"

class ChatRoomTest < ActiveSupport::TestCase
  test "no es valido sin titulo" do 
    chat_room = ChatRoom.new(name: nil)
    assert_not chat_room.valid?
    assert_includes chat_room.errors[:name], "can't be blank"
  end

  test "no es valido sin chatable" do 
    chat_room = ChatRoom.new(name: "hola", chatable: nil)
    assert_not chat_room.valid?
    assert_includes chat_room.errors[:chatable], "can't be blank"
  end
end
