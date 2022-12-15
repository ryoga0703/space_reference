class Public::RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.customer_id = current_customer.id
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:introduction, :room_image, :taste_id, :customer_id)
  end
end
