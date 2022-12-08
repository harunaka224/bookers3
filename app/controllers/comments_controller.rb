class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_user = @book.user
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = @book.id
    @comment.save
    flash[:notice] = '投稿にコメントしました。'
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_user = @book.user
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'コメントを削除しました。'
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end


