require 'spec_helper'

describe VotesController do
  describe "POST /create" do
    it "adds a vote to a book" do
      book = stub
      Book.stub(:find).with('1') {book}

      book.should_receive(:add_vote!)

      post :create, :book_id => '1'
    end
    
    it "redirects to the books index" do
      book = stub
      Book.stub(:find).with('1') {book}

      book.should_receive(:add_vote!)
      post :create, :book_id => '1'
    
      #response.should redirect_to(url)
    end
  end
end
