# frozen_string_literal: true

# Application controller is inherited from base
class ApplicationController < ActionController::Base
  helper_method :current_user

  # Returns current user
  def current_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end

  # Logs in the user and stores current user
  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    redirect_to root_path
  end

  # Checks if the user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Logs out the user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
