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
    sort_by = params[:sort_by] || 'id'
    @assignments = current_user.assignments.order(sort_by)
    @partners = current_user.partners
    @partner = Partner.new
    @clients = current_user.clients
    @client = Client.new
    @types = current_user.assignment_types
    @type = AssignmentType.new
    @assignment = Assignment.new
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