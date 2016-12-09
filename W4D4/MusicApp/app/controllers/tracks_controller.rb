class TracksController < ApplicationController
  before_action :log_in_first

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_tracks_url(@track.album_id)
    else
      flash.now[:messages] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:messages] = @track.errors.full_messages
      render :edit
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track.destroy
      redirect_to album_tracks_url(@track.album_id)
    else
      flash[:messages] = @track.errors.full_messages
      redirect_to album_tracks_url(@track.album_id)
    end
  end

  private

  def track_params
    params.require(:tracks).permit(:album_id, :name, :state, :lyrics)
  end

  def log_in_first
    redirect_to new_session_url unless logged_in?
  end
end
