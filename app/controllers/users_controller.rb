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
  
end
