class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    if user_signed_in?
      @task = Task.find(params[:task_id])
      @comment = @task.comments.build
      @comment.user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def create
      task = Task.find(params[:task_id])
      @comment = task.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to board_task_path(board_id: task.board_id, id: task.id), notice: 'Comment creation completed!'
      else
        flash.now[:error] = 'Comment creation failed.'
        render :new, status: :unprocessable_entity
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
