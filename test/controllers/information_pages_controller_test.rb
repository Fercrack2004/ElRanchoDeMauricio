require "test_helper"

class InformationPagesControllerTest < ActionDispatch::IntegrationTest
  test "index information" do 
    user = users(:one)
    information(:one)
    information_participations(:one)
    sign_in user

    get information_pages_url
    assert_response :success
  end

  test "show information" do 
    user = users(:one)
    information = information(:one)
    information_participations(:one)
    sign_in user

    get information_url(information) 
    assert_response :success
  end

  test "new information" do 
    user = users(:one)
    information(:one)
    information_participations(:one)
    sign_in user

    get new_information_path
    assert_response :success
  end

  test "edit information" do 
    user = users(:one)
    information = information(:one)
    information_participations(:one)
    sign_in user

    get edit_information_path(information)
    assert_response :success
  end

  test "update information" do 
    user = users(:one)
    information = information(:one)
    information_participations(:one)
    ChatRoom.create!(
      name: "chatroom",
      chatable: information
    )
    sign_in user
    patch information_url(information), params: {
    information: {
      title: "Nuevo título"
    }
    }
    assert_response :redirect
    assert_redirected_to information_path(information)
    assert_equal "Nuevo título", information.reload.title
  end

  test "requiere moderador redirigido" do 
    user = users(:two)
    information(:two)
    information_participations(:two)
    sign_in user
    get new_information_path
    assert_redirected_to root_path
    assert_equal "No tienes permisos para realizar esta acción.", flash[:alert]
  end

  test "requiere editor o autor redirigido" do 
    user = users(:three)
    information = information(:three)
    sign_in user

    get edit_information_path(information)
    assert_redirected_to root_path
    assert_equal "No tienes permisos para acceder a esta sección.", flash[:alert]
  end


end
