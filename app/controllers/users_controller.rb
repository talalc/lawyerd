class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash_message = ""
      @user.errors.messages.each do |field, message|
        flash_message += ": " + field.to_s.titleize + " " + message.first + " :"
      end
      flash[:notice] = flash_message
      redirect_to root_path
    end
  end

  def show
    @user = User.find(current_user.id) #not used
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end