class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id 
      redirect_to user_path(session[:current_user_id])
    else
      flash.alert = "Something's wrong here"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
