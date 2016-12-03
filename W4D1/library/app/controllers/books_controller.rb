class BooksController < ApplicationController
  attr_reader :books

  def index
    @books = Book.all
    # render index: books
  end

  def new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
