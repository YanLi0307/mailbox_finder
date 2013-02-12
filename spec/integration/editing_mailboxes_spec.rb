require 'spec_helper'

feature "Editing mailboxes" do
  scenario "Updating a mailbox" do
    let!(:mailbox) { Factory(:mailbox) }
    let!(:location) { Factory(:location, :street_one => "6th NE", :street_two => "Kent NE", :zip => '99999', :city => "Auburn", :state => 'WA', :mailbox => mailbox) }

    visit '/'
    click_link '6th NE and Kent NE'
    click_link 'Edit mailbox'
    fill_in "Street One", :with => "7th NW"
    click_link "Update mailbox"
    page.should have_content "Mailbox has been updated"
    page.should have_content "7th NW and Kent NE"
  end
end
