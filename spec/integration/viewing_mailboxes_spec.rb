require 'spec_helper'

feature "Viewing Mailboxes" do
  scenario "Listing all mailboxes" do
    mailbox = Factory.create(:mailbox, :address => "Franklin Ave East")
    visit '/'
    click_link 'Franklin Ave East'
    page.current_url.should == mailbox_url(mailbox)
  end

  # here are some codes for viewing locations.
  # address & location
#feature "Viewing locations" do
  before do
    franklin_ave_east = Factory(:mailbox, :address => "Franklin Ave East")
    location = Factory(:location,
      :mailbox => franklin_ave_east,
      :address => "Franklin Ave East",
      :state => "WA",
      :zip => "98102")

    internet_explorer = Factory(:mailbox, :location => "Franklin Ave East")

    Factory(:location,
            :mailbox => internet_explorer,
            :address => "Franklin Ave East",
            :state => "WA",
            :zip => "98102")
    visit '/'
  end
end