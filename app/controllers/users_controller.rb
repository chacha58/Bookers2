class UsersController < ApplicationController

    before_action :authenticate_user!
    before_action :correct_user, only: [:update, :edit]

    def index
        @book = Book.new
        @user = current_user
        @users = User.all
        # @user_image = @users.find(params[:id])

    end

    def show
        @user = User.find(params[:id])
        @user_post = @user.books
        @book = Book.new
        # @books = Book.all
    end

    def edit
        @user = User.find(params[:id])
        # flash[:edit] = "・Name is too short (minimum is 2 characters)"
    end

    def create
        book = Book.new(book_params)
        book.save
        redirect_to book_path(book.id)
        flash.now[:notice] = "You have created book successfully."
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:notice] = "You have updated user successfully."
          redirect_to user_path(current_user)
        else
          flash.now[:notice] = "・Name is too short (minimum is 2 characters)"
          render :edit
        end
    end

    private
    def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user)
      end
    end

end
