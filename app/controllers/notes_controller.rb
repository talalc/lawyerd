class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    assignment = Assignment.find(@note.assignment_id)
    if @note.save
      flash[:notice] = "Note added"
      redirect_to assignment_path(assignment)
    else
      flash[:notice] = "Invalid Note Properties"
      redirect_to assignment_path(assignment)
    end
  end

  def destroy
    note = Note.find_by(id: params[:id])
    assignment = Assignment.find(note.assignment_id)
    if note.destroy
      flash[:notice] = "Note removed"
      redirect_to assignment_path(assignment)
    else
      flash[:notice] = "Couldn't Remove Note"
      redirect_to assignment_path(assignment)
    end
  end

  private

  def note_params
    params.require(:note).permit(
      :content,
      :assignment_id
    )
  end

end