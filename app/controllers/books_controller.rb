class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create 
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: 'Books Created !'
    else
      render :new
    end
  end

  def show
    @book = Book.find_by!(id: params[:id])
  end

  def edit 
    @book = Book.find_by!(id: params[:id])
  end

  def update
    @book = Book.find_by!(id: params[:id])

    if @book.update(book_params)
      redirect_to books_path, notice: 'Books Updated !'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find_by!(id: params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Books Deleted !'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :info)
  end
end
