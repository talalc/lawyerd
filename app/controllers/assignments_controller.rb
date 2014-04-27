class AssignmentsController < ApplicationController

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      flash[:notice] = "Assignment added"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Invalid Assignment Properties"
      redirect_to user_path(current_user)
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @clients = current_user.clients
    @types = current_user.assignment_types
  end

  def update
    @assignment = Assignment.find(params[:id])

    if @assignment.update(assignment_params)
      flash[:notice] = "Assignment updated"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Invalid Assignment Properties"
      render :edit
    end
  end

  def destroy
    assignment = Assignment.find_by(id: params[:id])
    if assignment.destroy
      flash[:notice] = "Assignment removed"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Couldn't Remove Assignment"
      redirect_to user_path(current_user)
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    @note = Note.new
  end

  private

  def assignment_params
    params.require(:assignment).permit(
      :assigned_date,
      :due_date,
      :client_id,
      :assignment_type_id
    )
  end

end