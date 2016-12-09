class NotesController < ApplicationController
  before_action :log_in_first

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:messages] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if current_user.id == @note.user_id
      @note.destroy
    else
      flash[:messages] = @note.errors.full_messages
      # render text: "403 FORBIDDEN"
    end

    redirect_to track_url(@note.track_id)
  end

  private

  def note_params
    params.require(:notes).permit(:blurb, :track_id)
  end

  def log_in_first
    redirect_to new_session_url unless logged_in?
  end
end
