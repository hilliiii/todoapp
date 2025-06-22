class TasksController < ApplicationController
  before_action :authenticate_user!

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end

  def new
    if user_signed_in?
      board = Board.find(params[:board_id])
      @task = board.tasks.build
      @task.user_id = current_user.id
    else
      redirect_to new_user_session_path
    end
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    # @task.user_id = current_user.id
    if @task.save
      redirect_to board_path(id: board.id), notice: 'Task creation completed!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline)
  end
end
