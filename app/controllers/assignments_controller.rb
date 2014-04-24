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