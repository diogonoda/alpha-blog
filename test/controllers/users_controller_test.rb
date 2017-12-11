require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should successfully login" do
    get signup_path

    assert_template 'users/new'

    assert_difference 'User.count', 1 do
      post users_path, params:{
                               user:{
                                     username: "Test User",
                                     email: "user@test.com",
                                     password: "passwd",
                                     admin: true
                                     }
                               }

      follow_redirect!
    end

    assert_template 'users/show'

    assert_match "Test User", response.body
  end
end
