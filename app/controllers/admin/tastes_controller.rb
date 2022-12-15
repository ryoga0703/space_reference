class Admin::TastesController < ApplicationController
  def index
    @tastes = Taste.all
    @taste = Taste.new
  end

  def create
    @taste = Taste.new(taste_params)
    @taste.save
    redirect_to request.referer  # 簡単に同じページに遷移
  end

  def edit
    @taste = Taste.find(params[:id])
  end

  def update
    @taste = Taste.find(params[:id])
    if @taste.update(taste_params)
      redirect_to admin_tastes_path(@taste.id)
    else
      render :edit
    end
  end

  def destroy
    @taste = Taste.find(params[:id])
    @taste.destroy
    redirect_to request.referer
  end

  private

  def taste_params
    params.require(:taste).permit(:name)
  end
end
