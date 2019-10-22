require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(f_name: "User_fname", l_name: "User_lname", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  # userのf_nameの存在性の検証
  test "f_name should be present" do
    @user.f_name = "     "
    assert_not @user.valid?
  end
  
  # userのl_nameの存在性の検証
  test "l_name should be present" do
    @user.l_name = "     "
    assert_not @user.valid?
  end
  
  # userのemailの存在性の検証
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  # userの文字列の長さの検証
  test "f_name should not be too long" do
    @user.f_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "l_name should not be too long" do
    @user.l_name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  # 有効なメールフォーマットのテスト
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  # メールフォーマットの検証に対するテスト
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  # 重複するメールアドレス拒否のテスト
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
end
