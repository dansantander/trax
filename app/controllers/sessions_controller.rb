class SessionsController < ApplicationController
  def new; end

  def create
    if (userx = User.find_by(name: params[:username_in]))
      session[:current_user_id] = userx.id

      redirect_to user_path(session[:current_user_id]), notice: 'Succesfully signed in'
    else
      redirect_to root_path, alert: 'Please Sign Up before continuing'
    end
  end

  def show; end

  def destroy
    session.delete(:current_user_id)

    redirect_to root_path
  end
end
