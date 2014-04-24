class AssignmentTypesController < ApplicationController

  def create
    @assignment_type = AssignmentType.new(assignment_type_params)
    @assignment_type.user = current_user
    if @assignment_type.save
      flash[:notice] = "AssignmentType #{@assignment_type.name} added"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Invalid AssignmentType Properties"
      redirect_to user_path(current_user)
    end
  end

  private

  def assignment_type_params
    params.require(:assignment_type).permit(
      :name
    )
  end

end