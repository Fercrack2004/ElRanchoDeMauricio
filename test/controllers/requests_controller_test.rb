require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "request index blog" do

    user = User.create!(
      username: "willyrex",
      email: "hola@gmail.com",
      password: "password123",
      password_confirmation: "password123",
      phone_number: 961068629,
      role: :user
    )

    blog = Blog.create!(
      title: "Mi blog",
      public_type: "public",
      description: "Descripción del blog",
      cook_time: 30,
    )

    BlogParticipation.create!(
      user: user,
      blog: blog,
      contribution: :autor
    )
    sign_in user
    get blog_requests_path(blog)
    assert_response :success
  end

  test "request index information" do
      user = users(:one)

    sign_in user

    information = Information.create!(
    title: "Test",
    info_type: "k",
    description: "Texto"
  )
    InformationParticipation.create!(
    user: user,
    information: information,
    contribution: "autor"  
  )

    get information_requests_path(information.id)

    assert_response :success
    end

  test "request show" do
    user = users(:one)
    sign_in user
    blog = blogs(:one)

  BlogParticipation.create!(
    user: user,
    blog: blog,
    contribution: :autor
  )

  request = Request.create!(
    user: user,
    requestable: blog,
    state: 1
  )

  get blog_request_path(blog, request)

  assert_response :success
  end

  test "request new" do
    user = users(:one)
    sign_in user

    information = Information.create!(
    title: "Test",
    info_type: "k",
    description: "Texto"
  )

  InformationParticipation.create!(
    user: user,
    information: information,
    contribution: "autor"  
  )

  get new_information_request_path(information)
  assert_response :success
  end


end
