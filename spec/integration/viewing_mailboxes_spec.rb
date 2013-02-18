require 'spec_helper'

feature "Viewing Mailboxes" do
  scenario "Listing all mailboxes" do
    mailbox = Factory.create(:mailbox, :description => "Franklin Ave")
    visit '/'
    click_link 'Franklin Ave'
    page.current_url.should == mailbox_url(mailbox)
  end
end