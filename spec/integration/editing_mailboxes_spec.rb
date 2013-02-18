require 'spec_helper'

feature "Editing mailboxes" do
  let!(:location) { Factory(:location) }
  let!(:mailbox) { Factory(:mailbox, :location => location) }

  scenario "Updating a mailbox" do

    visit '/'
    click_link '4233 9th Ave NE'
    click_link 'Edit Mailbox'
    fill_in "Description", :with => "It's on fire."
    click_link "Update mailbox"
    page.should have_content "Mailbox has been updated"
    page.should have_content "7th NW and Kent NE"
  end
end
