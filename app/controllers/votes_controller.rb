class VotesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book.add_vote!
    redirect_to books_url    
  end
end
