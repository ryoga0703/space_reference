class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @comments = @room.comments.includes(:customer)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to admin_rooms_path
  end

  private

  def room_params
    # album_tracks_attributesが子のモデルに保存する要素
    #   :id, :_destroyをつけることで、編集と削除が可能になる
    params.require(:room).permit(:room_image, :taste_id, :introduction, furnitures_attributes: [:furniture_image, :name, :price, :introduction, :retailer_link, :_destroy, :id])
  end
end
