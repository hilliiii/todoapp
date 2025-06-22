class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @tasks = @board.tasks
  end

  def new
    if user_signed_in?
      @board = current_user.boards.build
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path, notice: 'Board creation completed!'
    else
      flash.now[:error] = 'Board creation failed.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: 'Board updated.'
    else
      flash.now[:error] = "Board couldn't be updated."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, status: :see_other, notice: 'Board removed.'
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end
end
