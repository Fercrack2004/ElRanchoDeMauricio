require "test_helper"



class UsersControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    user = users(:one)
    sign_in user

    get users_index_url
    assert_response :success
  end

  test "get show" do
    user = users(:one)
    sign_in user

    get user_url(user)
    assert_response :success
  end

  test "delete user" do 
    user = users(:one)
    sign_in user

    delete user_url(user)

    assert_response :redirect           
    assert_redirected_to root_path      
    assert_raises(ActiveRecord::RecordNotFound) do
      User.find(user.id)    
    end
  end
end
