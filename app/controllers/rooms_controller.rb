class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)    # 実装は終わっていないことに注意!
    if @room.save
      flash[:success] = "会議室の作成に成功しました。"
      redirect_to @room
    else
      render 'new'
    end
  end
  
  private
    def room_params
      params.require(:room).permit(:name, :capacity, :price, :open_at, :close_at)
    end
end
