class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @user = User.new(params[:user])    # 実装は終わっていないことに注意!
    if @user.save
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
  end
  
  def room_params
    params.require(:room).permit(:name, :capacity, :price, :open_at, :close_at)
  end
end
