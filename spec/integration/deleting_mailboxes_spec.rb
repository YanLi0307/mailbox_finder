require 'spec_helper'

feature "Deleting mailboxes" do
  scenario "Deleting a project" do
    Factory(:mailbox, :description => "Test mailbox")
    visit "/"
    click_link "Test mailbox"
    click_link "Delete Project"
    page.should have_content("Mailbox went gone!")

    visit "/"
    page.should_not have_content("Test mailbox")
  end
end