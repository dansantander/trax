class SessionsController < ApplicationController
  
  def new; end

  def create
    if (userx = User.find_by(name: params[:username_in]))
      session[:current_user_id] = userx.id

      redirect_to user_path(session[:current_user_id])
    else
      flash.notice = 'You are not registered. Please Sign up'
      
      render 'sessions#new'
    end
  end

  def show
    
  end

  def destroy
    session.delete(:current_user_id)

    redirect_to root_path
  end
end
