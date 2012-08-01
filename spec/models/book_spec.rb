require 'spec_helper'

describe Book do
  describe ".sort_by_votes" do
    it "returns books sorted by votes" do
      book1 = Book.create title: "Book 1", author: "Author 1"
      book2 = Book.create title: "Book 2", author: "Author 2"

      book1.update_attribute :votes, 5
      book2.update_attribute :votes, 2

      Book.sort_by_votes.should == [book1, book2]

      book1.update_attribute :votes, 2
      book2.update_attribute :votes, 5

      Book.sort_by_votes.should == [book2, book1]
      
    end
  end

  describe "initial values" do
    it "default votes to 0" do 
      Book.create.votes.should == 0
    end
  end

  describe "#add_vote!" do
    it "increments the votes" do
      book = Book.create title: "Book 1", :votes => 10
      book.add_vote!
      
      book.reload
      book.votes.should == 11
    end
  end
end
