class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to admin_rooms_path
  end
end
