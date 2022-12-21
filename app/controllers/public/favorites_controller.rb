class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  def create
    @room_favorite = Favorite.new(customer_id: current_customer.id, room_id: params[:room_id])
    @room_favorite.save
    redirect_to request.referer  # 同じページにリダイレクト
  end

  def destroy
    @room_favorite = Favorite.find_by(customer_id: current_customer.id, room_id: params[:room_id])
    @room_favorite.destroy
    redirect_to request.referer
  end
end
