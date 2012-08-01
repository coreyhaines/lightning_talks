require 'spec_helper'

describe "initialize" do
  example "server" do
    visit '/'
    page.should have_content('Welcome aboard')
  end
end
