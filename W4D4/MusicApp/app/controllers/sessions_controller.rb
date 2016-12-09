class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:messages] = ["Incorrect Username & Password"]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
