class SessionController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in Successfully!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Invalid Credentials"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out Successfully!"
    redirect_to root_path
  end

end