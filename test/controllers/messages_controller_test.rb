require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "message create" do 
    user = users(:one)
    blog = blogs(:one)
    chat_room = ChatRoom.create!(
      name: "chatroom",
      chatable: blog)
  
    sign_in user
    assert_difference("Message.count", 1) do
      post blog_chat_room_messages_path(blog, chat_room), params: {
      message: { content: "hola" }
    }
    end

    assert_redirected_to [blog, chat_room]
    assert_equal "hola", Message.last.content
    assert_equal user, Message.last.user

  end

  test "mensaje inválido" do
    user = users(:one)
    blog = blogs(:one)
  chat_room = ChatRoom.create!(
    name: "chatroom",
    chatable: blog
  )
    sign_in user
    post blog_chat_room_messages_path(blog_id: blog.id, chat_room_id: chat_room.id), params: {
    message: { content: "" }
    }
    assert_redirected_to blog_chat_room_path(blog, chat_room)
    assert_equal 0, chat_room.messages.count
    follow_redirect!
    assert_match "Mensaje no pudo ser enviado", response.body
  end

  test "autorizar usuario" do 
    user = users(:two)
    blog = blogs(:one)
    chat_room = ChatRoom.create!(
      name: "chatroom",
      chatable: blog
    )
    sign_in user
    post blog_chat_room_messages_path(blog_id: blog.id, chat_room_id: chat_room.id), params: {
    message: { content: "Mensaje no autorizado" }
    }
    assert_redirected_to root_path
    assert_equal 0, chat_room.messages.count
    follow_redirect!
    assert_match "No tienes permiso para enviar mensajes", response.body
  end
  
end
