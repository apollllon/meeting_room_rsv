class RoomsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @rooms = Room.all
  end
  
  # カレンダーを表示させ、カレンダー上をクリックすると予定を作成できるようにする
  def show
    @room = Room.find(params[:id])
  end
  
  # スケジュールの新規作成
  def new_schedule
    @room = Room.find(params[:id])
    @schedule = Schedule.new
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
  
  def edit
    @room = Room.find(params[:id])
    @room_name = @room.name
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "#{@room.name}が更新されました。"
      redirect_to @room
    else
      render 'edit'
    end
  end
  
  def destroy
    room = Room.find(params[:id])
    flash[:success] = "#{room.name} を消去しました。"
    room.destroy
    redirect_to rooms_path
  end
  
  private
    def room_params
      params.require(:room).permit(:name, :capacity, :price, :open_at, :close_at)
    end
end
