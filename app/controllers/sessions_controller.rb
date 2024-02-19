# frozen_string_literal: true

# Session controller
class SessionsController < ApplicationController
  # Logs in the user
  def create
    user = User.find_by(username: params[:username])
    if user
      log_in(user)
    else
      render 'new'
    end
  end

  # Logs out the user
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
