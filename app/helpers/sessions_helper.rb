module SessionsHelper
  def current_user
    current_user = User.find_by(id: session[:current_user_id])
  end
end
