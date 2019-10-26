require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should get calender" do
    get users_calender_path
    assert_response :success
  end
  
  # login_page
  test "should get root" do
    get root_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { f_name: @user.f_name,
                                              l_name: @user.l_name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert !flash.empty?
    assert_redirected_to rooms_path
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { f_name: @user.f_name,
                                              l_name: @user.l_name,
                                              email: @user.email } }
    assert !flash.empty?
    assert_redirected_to rooms_path
  end
  
  # ログイン済みユーザが新規登録ページアクセスできないテスト
  test "should redirect new when user already logged in" do
    log_in_as(@user)
    get root_path
    assert !flash.empty?
    assert_redirected_to @user
  end
  
  test "should redirect create when user already logged in" do
    log_in_as(@user)
    post users_path, params: { user: { f_name: @user.f_name,
                                              l_name: @user.l_name,
                                              email: @user.email,
                                              password: "password",
                                              password_confirmation: "password" } }
    assert !flash.empty?
    assert_redirected_to @user
  end
  
  
end
