require 'spec_helper'

feature "Viewing the books sorted by vote count" do
  example "no books about an empty sorted page" do
    visit "/books/sorted"  
    all(".book").should be_empty
  end

  example "multiple books are listed in order of votes" do
    book1 = Book.create title: "Book 1", author: "Author 1", votes: 3
    book2 = Book.create title: "Book 2", author: "Author 1", votes: 1
    book3 = Book.create title: "Book 3", author: "Author 1", votes: 4
    book4 = Book.create title: "Book 4", author: "Author 1", votes: 2
    
    visit "/books/sorted"
  
    books_all = all(".book")
    books_all[0]["id"].should == "book_#{book3.id}"
    books_all[1]["id"].should == "book_#{book1.id}"
    books_all[2]["id"].should == "book_#{book4.id}"
    books_all[3]["id"].should == "book_#{book2.id}"
  end

end
