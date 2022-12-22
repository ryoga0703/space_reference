class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  before_action :search_admin
  def top
    # distinct: trueは重複したデータを除外
    @customers = @q.result(distinct: true)
  end

  def search_admin
    # params[:q]のqには検索フォームに入力した値が入る
    @q = Customer.ransack(params[:q])
  end
end
