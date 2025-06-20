class AvatarsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'Avatar update completed.'
    else
      flash.now[:error] = 'Avatar update failed.'
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
