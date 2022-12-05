class CommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    flash[:notice] = '投稿にコメントしました。'
    redirect_to request.referer
  end

  def destroy
    Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    flash[:notice] = 'コメントを削除しました。'
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

