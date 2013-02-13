require 'spec_helper'

feature "Editing mailboxes" do
  let!(:location) { Factory(:location) }
  let!(:mailbox) { Factory(:mailbox, :location => location) }

  scenario "Updating a mailbox" do

    visit '/'
    click_link '6th NE and Kent NE'
    click_link 'Edit mailbox'
    fill_in "Street One", :with => "7th NW"
    click_link "Update mailbox"
    page.should have_content "Mailbox has been updated"
    page.should have_content "7th NW and Kent NE"
  end
end
