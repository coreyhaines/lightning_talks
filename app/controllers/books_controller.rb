class BooksController < ApplicationController
  def index
    @theme = Theme.find(params[:theme_id])
    @books = Book.all
  end

  def sorted
    @books = Book.sort_by_votes  
  end

  def new
    @theme = Theme.find(params[:theme_id])
    @book = Book.new
  end
  
  def create
    @book = Book.create(params[:book])
    redirect_to theme_books_url
  end

end
