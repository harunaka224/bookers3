class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
    @book_user = @book.user
    @book_new = Book.new
    @comment = Comment.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def edit

  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  end
end

