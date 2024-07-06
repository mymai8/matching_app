class DirectmessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.find(params[:room_id])
    @directmessage = @room.directmessages.build(directmessage_params)
    @directmessage.user = current_user
    if @directmessage.save
      redirect_to room_path(@room)
    else
      render 'rooms/show'
    end
  end

  private

  def directmessage_params
    params.require(:directmessage).permit(:content)
  end
end
