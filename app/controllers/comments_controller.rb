class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @coach = Coach.find(params[:coach_id])
    if @comment.save
      CommentChannel.broadcast_to @coach, { comment: @comment, user: @comment.user }
    end 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, coach_id: params[:coach_id])
  end
end
