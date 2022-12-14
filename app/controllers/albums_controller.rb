class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to albums_path
  end

  private

  def album_params
    # album_tracks_attributesが子のモデルに保存する要素
    #   :id, :_destroyをつけることで、編集と削除が可能になる
    params.require(:album).permit(
      :title, :artist,
      album_tracks_attributes: [:id, :title, :_destroy])
  end
end
