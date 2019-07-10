class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_current_user, except: [:show]

  before_action :set_user, only: [:show]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: ('User was updated')
    else
      render :edit
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :bg_color, :color)
  end
end
