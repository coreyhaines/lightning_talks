class VotesController < ApplicationController
  def create
    @book = Book.find(params[:book])
    @book.add_vote!
    redirect_to books_url    
  end
end
