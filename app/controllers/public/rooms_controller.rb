class Public::RoomsController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_check, only: [:new, :create, :edit, :update, :destroy]
  before_action :search
  def index
    # distinct: trueは重複したデータを除外
    @rooms = @q.result(distinct: true)
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
    @room = current_customer.rooms.find(params[:id])
  end

  def update
    @room = current_customer.rooms.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @room = current_customer.rooms.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def guest_check
    if current_customer == Customer.find(1)
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end

  def search
    # params[:q]のqには検索フォームに入力した値が入る
    @q = Room.ransack(params[:q])
  end

  private

  def room_params
    # album_tracks_attributesが子のモデルに保存する要素
    #   :id, :_destroyをつけることで、編集と削除が可能になる
    params.require(:room).permit(:room_image, :taste_id, :introduction, :customer_id, furnitures_attributes: [:furniture_image, :name, :price, :introduction, :retailer_link, :_destroy, :id])
  end
end
