class Public::RoomsController < ApplicationController
  def index
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.customer_id = current_customer.id
    if @room.save
      redirect_to room_path(@room)
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
    # album_tracks_attributesが子のモデルに保存する要素
    #   :id, :_destroyをつけることで、編集と削除が可能になる
    params.require(:room).permit(:room_image, :taste_id, :introduction, furnitures_attributes: [:furniture_image, :name, :price, :introduction, :retailer_link, :_destroy, :id])
  end
end
