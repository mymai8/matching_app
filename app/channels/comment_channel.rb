class CommentChannel < ApplicationCable::Channel
  def subscribed
    @coach = Coach.find(params[:coach_id])
    stream_for @coach
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
