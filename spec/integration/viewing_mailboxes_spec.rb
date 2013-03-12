require 'spec_helper'

feature "Viewing Mailboxes" do
  fixtures :mailboxes
  before do
    visit '/'
  end

  scenario "Viewing a Mailbox" do
    mailbox = mailboxes(:one)
    click_link mailbox.location.normalized_address
    page.current_url.should == mailbox_url(mailbox)
  end
end
