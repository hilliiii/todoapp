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
    else
      redirect_to new_user_session_path
    end
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.creator = current_user
    if @task.save
      redirect_to board_path(id: board.id), notice: 'Task creation completed!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = current_user.created_tasks.find(params[:id])
  end

  def update
    board = Board.find(params[:board_id])
    @task = current_user.created_tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_path(id: board.id), notice: 'Task updated.'
    else
      flash.now[:error] = "Task couldn't be updated."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :assignee_id)
  end
end
