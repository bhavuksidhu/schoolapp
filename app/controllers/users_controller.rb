class UsersController < ApplicationController
 before_action :authenticate_user!

  def edit
    @user=User.new
    @user.current_user
  end

  def update
    if current_user.update_with_password(user_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:admin).permit(:current_password, :password, :password_confirmation)
  end
  
  end
