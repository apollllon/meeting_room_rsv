require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { f_name:  "",
                                              l_name: "foo",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end
  
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    f_name = "Foo"
    l_name = "Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { f_name:  f_name,
                                              l_name:  l_name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal f_name,  @user.f_name
    assert_equal l_name,  @user.l_name
    assert_equal email, @user.email
  end
  
end