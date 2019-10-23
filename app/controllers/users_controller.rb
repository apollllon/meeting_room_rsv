class UsersController < ApplicationController
  # マイカレンダー
  def calender
  end
  
  # マイページ
  def edit
  end
  
  # ログインフォーム
  def login_form
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "アカウント作成に成功しました"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:f_name, :l_name, :email, :password,
                                     :password_confirmation)
    end
  
end
