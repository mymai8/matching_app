class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.new
  end

  def index
    #binding.pry
    if current_user.role.id == 1
      @rooms = Room.where(coach_id: current_user.coaches.ids)
    else
      @rooms = current_user.rooms
    end
  end

  def show
    @room = Room.find(params[:id])
    @directmessage = Directmessage.new
    @directmessages = @room.directmessages
  end
end
