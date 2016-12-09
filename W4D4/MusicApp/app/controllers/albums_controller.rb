class AlbumsController < ApplicationController
  before_action :log_in_first

  def index
    @band = Band.find_by(id: params[:band_id])
    @albums = @band.albums
    render :index
  end

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:messages] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:messages] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album.destroy
      redirect_to band_albums_url(@album.band_id)
    else
      flash[:messages] = @album.errors.full_messages
      redirect_to band_albums_url(@album.band_id)
    end
  end

  private

  def album_params
    params.require(:albums).permit(:band_id, :name, :state)
  end

  def log_in_first
    redirect_to new_session_url unless logged_in?
  end
end
