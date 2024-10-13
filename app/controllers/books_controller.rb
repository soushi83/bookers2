class BooksController < ApplicationController
  def index
    @books = Book.all
    @new_book = Book.new
  end

  def create
    @new_book = current_user.books.build(book_params)

    if @new_book.save
      redirect_to book_path(@new_book), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end