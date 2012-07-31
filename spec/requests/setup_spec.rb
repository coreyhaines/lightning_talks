require 'spec_helper'

feature "Rails is set up" do
  example "Can view homepage with capybara" do
    visit "/"
    page.should have_content("Welcome aboard")
  end
end
