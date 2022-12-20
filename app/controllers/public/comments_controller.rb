class Public::CommentsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @comment = current_customer.comments.build(comment_params)
    if @comment.save
      redirect_to request.referer, notice: "コメントを投稿しました"
    else
      flash[:danger] = "コメントの投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @room = current_customer.rooms.find(params[:room_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to room_path(@room), notice: "コメントを編集しました"
    else
      flash.now[:danger] = "コメントの編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @comment = current_customer.comments.find(params[:id])
    @comment.destroy
    flash[:danger] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(room_id: params[:room_id])
  end
end