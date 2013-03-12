require 'spec_helper'

feature "Editing mailboxes" do
  fixtures :mailboxes, :locations

  before(:each) do
    @mailbox = mailboxes(:one)
  end

  scenario "Updating a mailbox" do
    visit '/'
    click_link @mailbox.location.normalized_address
    click_link 'Edit Mailbox'
    fill_in "Description", :with => "It's on fire."
    click_link "Update Mailbox"
    page.should have_content "Mailbox has been updated"
    page.should have_content "It's on fire."
  end
end
