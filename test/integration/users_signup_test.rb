require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  # 無効なユーザ登録に対するテスト
  test "invalid signup information" do
    get root_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { f_name:  "", l_name: "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
  
  # 有効なユーザ登録にタイステスト
  test "valid signup information" do
    get root_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { f_name:  "User", l_name: "Example",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

end
