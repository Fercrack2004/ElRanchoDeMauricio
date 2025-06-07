require "test_helper"

class ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  test "show chat room blog" do
    user = users(:one)
    blog = blogs(:one)
    sign_in user
    chat_room = ChatRoom.create!(
  name: "Sala de Chat del Blog",
  chatable: blog
  )
    get blog_chat_room_path(blog,chat_room)
    assert_response :success
  end

  test "show chat room info" do
    user = users(:one)
    information = information(:one)
    sign_in user
    chat_room = ChatRoom.create!(
    name: "Sala de Chat del Info",
    chatable: information
    )
    get information_chat_room_path(information,chat_room)
    assert_response :success
  end

end
