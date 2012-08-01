require 'spec_helper'

describe VotesController do
  describe "POST /create" do
    it "adds a vote to a book" do
      theme = stub
      Theme.stub(:find).with('1') {theme}
      
      book = stub
      Book.stub(:find).with('1') {book}

      book.should_receive(:add_vote!)

      post :create, :theme_id => '1', :book_id => '1'
    end
    
    it "redirects to the books index" do
      theme = stub
      Theme.stub(:find).with('1') {theme}
      
      book = stub
      Book.stub(:find).with('1') {book}

      book.should_receive(:add_vote!)
      post :create, :theme_id => '1', :book_id => '1'
    
      response.should redirect_to(theme_books_url)
    end
  end
end
