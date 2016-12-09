class BandsController < ApplicationController
  before_action :log_in_first

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:messages] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      #show page
      redirect_to band_url(@band)
    else
      #flash message - band couldn't be updated
      render :edit
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      #flash message
      redirect_to bands_url
    end
  end

  private

  def band_params
    params.require(:bands).permit(:name)
  end

  def log_in_first
    redirect_to new_session_url unless logged_in?
  end
end
