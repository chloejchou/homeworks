class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in(user)
    session[:session_token] = user.session_token
  end

  def log_out
    current_user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)

    if user
      user.reset_session_token!
      log_in(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  helper_method :current_user
end
