# frozen_string_literal: true

# Rooms controller
class RoomsController < ApplicationController
  # Creates room
  def create
    @room = Room.create(name: params["room"]["name"])
  end

  # Displays all the rooms and users(except current user)
  def index
    @current_user = current_user
    redirect_to '/sessions/new' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end

  # Displays a single room for group chat
  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    render "index"
  end

end
