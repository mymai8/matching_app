class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    @student = Student.find(params[:student_id])
    if @chat.save
      ChatChannel.broadcast_to @student, { chat: @chat, user: @chat.user }
    end 
  end

  private
  def chat_params
    params.require(:chat).permit(:text).merge(user_id: current_user.id, student_id: params[:student_id])
  end
end
