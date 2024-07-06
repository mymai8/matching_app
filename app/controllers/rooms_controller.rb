class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    binding.pry
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @directmessage = DirectMessage.new
    @directmessages = @room.directmessages
  end
end
