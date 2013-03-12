require 'spec_helper'

feature "Deleting mailboxes" do
  fixtures :mailboxes, :locations

  before(:each) do
    @mailbox = mailboxes(:one)
  end

  scenario "Deleting a project" do
    visit "/"
    click_link "Test mailbox"
    click_link "Delete Project"
    page.should have_content("Mailbox went gone!")

    visit "/"
    page.should_not have_content("Test mailbox")
  end
end