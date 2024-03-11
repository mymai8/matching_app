class ChatChannel < ApplicationCable::Channel
  def subscribed
    @student = Student.find(params[:student_id])
    stream_for @student
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
