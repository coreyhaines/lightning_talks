require 'spec_helper'

feature "Creating a Book" do
  example "a book is created with valid parameters" do
    visit "/books/new"
    fillin "book_title", :with => "testbook"
    click_button "Submit your Book"
    page.should have_content "testbook"
 end
end

