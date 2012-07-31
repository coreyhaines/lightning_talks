require 'spec_helper'

feature "Voting for books" do
  example "Voting for a book" do
    #Arrange
    book = Book.create title: "Book 1", author: "Author 1", votes: 0
    previous_votes = book.votes

    #Act
    visit "/books"
    within("#book_#{book.id}") do
      click_link "Vote"
    end

    #Assert
    #Have to reload in rails to check the updated value
    book.reload
    book.votes.should == previous_votes + 1
  end
  
  example "Vote for one book and not the other" do 
    book1 = Book.create title: "Book 1", author: "Author 1", votes: 0
    book2 = Book.create title: "Book 2", author: "Author 2", votes: 0
    prev_book1_votes = book1.votes
    prev_book2_votes = book2.votes

    visit "/books"
    within("#book_#{book1.id}") do
      click_link "Vote"
    end

    book1.reload
    book2.reload
    book1.votes.should == prev_book1_votes + 1
    book2.votes.should == prev_book2_votes
  end
end
