require 'spec_helper'


feature "Rails is set up" do
  example "Can view the homepage" do
    visit "/"
    page.should have_content "Welcome aboard"
  end
end
