class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :ban_to_loggin_user, only: [:new, :create]
  
  # マイカレンダー
  def calendar
    @user = User.find(current_user.id)
    @schedules = @user.schedules.order(start_at: "ASC")
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:f_name, :l_name, :email, :password,
                                     :password_confirmation)
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "アクセス権限がありません。"
        redirect_to(rooms_path)
      end
    end
    
    def ban_to_loggin_user
      if logged_in?
        flash[:danger] = "ログインは完了しています。"
        redirect_to current_user
      end
    end
end
