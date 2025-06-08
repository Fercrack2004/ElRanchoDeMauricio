require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "index blogs" do 
    blogs(:one)
    get blogs_path
    assert_response :success
  end

  test "show blog" do  
    user = users(:one)
    blogs(:one)
    sign_in user
    get blog_path(user)
    assert_response :success
  end

  test "new blog" do 
    user = users(:one)
    blogs(:one)
    sign_in user
    get new_blog_path(user)
    assert_response :success
  end

  test "edit blog" do 
    user = users(:one)
    blogs(:one)
    sign_in user
    get edit_blog_path(user)
    assert_response :success
  end

  test "update blog" do 
    user = users(:one)
    blog = blogs(:one)
    blog_participations(:one)
    sign_in user
    ChatRoom.create!(
      name: "chatroom",
      chatable: blog
    )
    patch blog_path(blog), params: {
    blog: {
      title: "Nuevo título"
      }
    }
    assert_response :redirect
    assert_redirected_to blog_path(blog)
    assert_equal "Nuevo título", blog.reload.title
  end

  test "redirigido si no es moderador" do 
    user = users(:two)
    blogs(:two)
    blog_participations(:two)
    sign_in user
    get new_blog_path
    assert_redirected_to root_path
    assert_equal "No tienes permisos para realizar esta acción.", flash[:alert]
  end

  test "requiere editor o autor redirigido" do 
    user = users(:three)
    blogs(:three)
    sign_in user

    get edit_blog_path(information)
    assert_redirected_to root_path
    assert_equal "No tienes permisos para acceder a esta sección.", flash[:alert]
  end



end
