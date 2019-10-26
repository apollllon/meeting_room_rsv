class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end
  
  def new
  end
end
