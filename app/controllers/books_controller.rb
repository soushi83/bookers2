class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destroy]

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
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successefully update.'
    else
      render :edit
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end