require 'spec_helper'

feature "Creating new book" do 
  example "Link to Create a new book exists in Books page" do
    theme = Theme.create title: "Theme 1"
    visit "/themes/#{theme.id}/books/new"
  end

  example "Text fields exist in Create New Book pages" do 
    theme = Theme.create title: "Theme 1"
    visit "/themes/#{theme.id}/books/new"

    fill_in "Title", :with => "Book 1"
    fill_in "Author", :with => "Author 1"
    click_button "Submit New Book"
  
    current_path.should == "/themes/#{theme.id}/books"
  end

  example "Create a New Book will populate a new book in Books page" do
    theme = Theme.create title: "Theme 1"
    visit "/themes/#{theme.id}/books/new"
    
    fill_in "Title", :with => "Book 1"
    fill_in "Author", :with => "Author 1"
    click_button "Submit New Book"
    
    current_path.should == "/themes/#{theme.id}/books"
  
    page.should have_content("Book 1 by Author 1")
  end
end

