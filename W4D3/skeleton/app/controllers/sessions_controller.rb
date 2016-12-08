class SessionsController < ApplicationController
  before_action :redirect_to_cats, if: :signed_in?, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:user_name], session_params[:password])
    login_user!(user)
  end

  def destroy
    if current_user
      log_out
    end

    session[:session_token] = ""
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end

  def redirect_to_cats
    redirect_to cats_url
  end

  def signed_in?
    !current_user.nil?
  end

end
