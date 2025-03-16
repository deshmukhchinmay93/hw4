class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
