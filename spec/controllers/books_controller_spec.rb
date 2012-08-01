require 'spec_helper'

describe BooksController do
  
  describe "GET /index" do
    it "returns all the books" do
      theme = stub
      Theme.stub(:find).with('1') {theme}
      
      all_books = stub
      Book.stub(:all) {all_books}

      get :index, :theme_id => '1'

      assigns[:books].should be(all_books)
    end
  end

  describe "GET /sorted" do
    it "returns books sorted by votes" do
      theme = stub
      Theme.stub(:find).with('1') {theme}
      
      sorted_books = stub
      # whenever :sorted_by_votes gets called, return sorted_books value
      Book.stub(:sort_by_votes) {sorted_books}

      # can also replace stub with should_receive to set up expectations
      # that the method should be called.
      # Book.should_receive(:sorted_by_votes) {sorted_books}

      get :sorted, :theme_id => '1'

      assigns[:books].should be(sorted_books)
    end
  end

end
