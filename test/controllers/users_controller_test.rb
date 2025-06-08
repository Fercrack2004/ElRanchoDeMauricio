require "test_helper"



class UsersControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    user = users(:one)
    user.role = "admin"
    user.save!
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
  admin = users(:one)
  admin.role = "admin"
  admin.save!

  user = users(:two)
  sign_in admin

  delete user_url(user)

  assert_response :redirect           
  assert_redirected_to users_path      
  assert_raises(ActiveRecord::RecordNotFound) do
    User.find(user.id)    
  end
  end
end
