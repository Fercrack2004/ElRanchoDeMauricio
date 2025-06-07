require "test_helper"

class BlogParticipationTest < ActiveSupport::TestCase
   test "no es valido sin contribution" do
    user = users(:one)
    blog = blogs(:one)
    participacion = BlogParticipation.new(user: user, blog: blog, contribution: nil)

    assert_not participacion.valid?
    assert_includes participacion.errors[:contribution], "can't be blank"
   end

  test "no es valido sin usuario" do
    blog = blogs(:one)
    participacion = BlogParticipation.new(user: nil, blog: blog, contribution: 1)

    assert_not participacion.valid?
    assert_includes participacion.errors[:user], "must exist"
   end

  test "no es valido sin blog" do
    user = users(:one)
    participacion = BlogParticipation.new(user: user, blog: nil, contribution: 1)

    assert_not participacion.valid?
    assert_includes participacion.errors[:blog], "must exist"
   end

test "no puede tener más de un chat_room" do
  blog = blogs(:one)
  chat_room1 = ChatRoom.create!(name: "hola 1", chatable: blog)
  
  chat_room2 = ChatRoom.new(name: "hola 2", chatable: blog)

  assert_not chat_room2.save, "Se guardó un segundo chat_room para el mismo blog"
  assert_includes chat_room2.errors[:chatable_id], "has already been taken"
end
end
