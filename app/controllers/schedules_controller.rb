class SchedulesController < ApplicationController
  
  def show
    @schedule = Schedule.find_by(params[:id])
  end
  
  def index
    @schedules = Schedule.all
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
