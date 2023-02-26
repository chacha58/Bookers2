class BooksController < ApplicationController

  before_action :authenticate_user!

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
    # @user_prms = User.find(params[:id])
    # @user_post = @user_prms.books
    # @user = current_user
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
     params.require(:book).permit(:title, :body)
    end
    def user_params
      params.require(:user).permit(:name, :introduction)
    end

end
