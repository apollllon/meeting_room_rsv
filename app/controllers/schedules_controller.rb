class SchedulesController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def edit
    @schedule = Schedule.find(params[:id])
    @room = Room.find(@schedule.room_id)
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  # ユーザの所有するスケジュールをjson形式で取得
  def myschedules
    @user = User.find(current_user.id)
    @schedules = @user.schedules
  end

  # ルームの所有するスケジュールをjson形式で取得
  def roomschedules
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
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(schedule_params)
      flash[:success] = "#{@schedule.name}が更新されました。"
      redirect_to @schedule
    else
      render 'edit'
    end
  end
  
  def destroy
    schedule = Schedule.find(params[:id])
    flash[:success] = "#{schedule.name} を消去しました。"
    schedule.destroy
    redirect_to users_calendar_path
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:name, :content, :start_at, :end_at, :room_id)
    end
    
    def correct_user
      @schedule = Schedule.find(params[:id])
      unless current_user?(@schedule.user)
        flash[:danger] = "アクセス権限がありません。"
        redirect_to(rooms_path)
      end
    end
end
