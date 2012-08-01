require 'spec_helper'

feature "Viewing the list of books" do
  example "Shows theme that books belong to" do
    theme = Theme.create title: "Theme 1"
    visit theme_books_url(theme)
    page.should have_content("Books for Theme 1")
  end
  
  example "No books should show empty page" do
    theme = Theme.create title: "Theme 1"
    visit theme_books_url(theme)
    all(".book").should be_empty
  end
  
  example "One book will show on the books listing page" do
    Book.create title: "Book 1", author: "Author 1"
    theme = Theme.create title: "Theme 1"
    visit theme_books_url(theme)
    page.should have_css(".book", text: "Book 1")
  end

  example "The books page should only show books for that theme" do
  #create two books for two different themes
    book1 = Book.create title: "Book 1", author: "Author 1"
    book2 = Book.create title: "Book 2", author: "Author 2"

    theme1 = Theme.create title: "Theme 1"
    theme2 = Theme.create title: "Theme 2"
    
    
    
  end

end
