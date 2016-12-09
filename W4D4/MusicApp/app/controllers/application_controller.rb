class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  attr_reader :current_user

  def log_in_user!(user)
    # set the cookie
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out
    # changes the session token in the DB
    # session_token in the cookie no longer matches
    current_user.reset_session_token!
  end

  def current_user
    # there is a current_user if the cookie token matches the DB token
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    user = current_user
    !user.nil?
  end

  # makes this method available in the views
  helper_method :current_user, :logged_in?

end
