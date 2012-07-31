require 'spec_helper'

feature "Viewing the list of books" do
  example "No books should show empty page" do
    visit "/books"

    all(".book").should be_empty
  end
  
  example "One book will show on the books listing page" do
    Book.create title: "Book 1", author: "Author 1"
    visit "/books"
    page.should have_css(".book", text: "Book 1")
  end
end
