require 'spec_helper'

feature "Voting for books" do
  example "Voting for a book" do
    #Arrange
    book = Book.create title: "Book 1", author: "Author 1"
    previous_votes = book.votes

    #Act
    visit "/books"
    within("#book_#{book.id}") do
      click_link "Vote"
    end

    #Assert
    #Have to reload in rails to check the updated value
    book.reload
    book.votes.should == previous_votes+1
  end
end
