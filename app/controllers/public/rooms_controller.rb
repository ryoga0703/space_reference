class Public::RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
    @comments = @room.comments.includes(:customer)
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
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    # album_tracks_attributesが子のモデルに保存する要素
    #   :id, :_destroyをつけることで、編集と削除が可能になる
    params.require(:room).permit(:room_image, :taste_id, :introduction, furnitures_attributes: [:furniture_image, :name, :price, :introduction, :retailer_link, :_destroy, :id])
  end
end
