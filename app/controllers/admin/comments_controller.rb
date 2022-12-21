class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(room_id: params[:room_id])
  end
end
