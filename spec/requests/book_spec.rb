require 'spec_helper'

feature "Creating a Book" do
  example "a book is created with valid parameters" do
    visit "/books/new"
    fill_in "book_title", :with => "testbook1"
    click_button "Submit your Book"
    
    all_books = all(".book")
    p all_books[0]["id"]
    all_books[0]["id"].should == "book_#{Book.last.id}"
  end

  example "viewing sorted by vote count" do
    book1 = Book.create title: "testbook1", :like_count => 3
    book2 = Book.create title: "testbook2", :like_count => 10

    visit "/books/sorted"
    
    all_books = all(".book")
    p all_books.length
    all_books[0]["id"].should == "book_#{book2.id}"
  end
end
