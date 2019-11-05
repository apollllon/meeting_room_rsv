class SchedulesController < ApplicationController
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  # ユーザの所有するスケジュールをjson形式で取得
  def myschedules
    @user = User.find(current_user.id)
    @schedules = @user.schedules
  end

  # ルームの所有するスケジュールをjson形式で取得
  def rooomschedules
    @room = Room.find(params[:id])
    @schedules = @room.schedules
  end
  
  def new
    @room = Room.find(params[:room_id])
    @schedule = Schedule.new
  end
  
  def create
    @room = Room.find(params[:schedule][:room_id])
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = "予約を作成しました。"
      redirect_to rooms_path
    else
      render 'new'
    end
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:name, :content, :start_at, :end_at, :room_id)
    end
end
