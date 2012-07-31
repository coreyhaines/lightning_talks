class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def sorted
    @books = Book.sort_by_votes  
  end

  def new
    @books = Book.new
  end
  
  def create
    @books = Book.create(params[:book_id])
  end

end
