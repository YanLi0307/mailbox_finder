require 'spec_helper'

feature 'Creating Mailboxes' do
  scenario "can add a new mailbox" do
    visit '/'
    click_link 'Add New Mailbox'
    # fill_in 'Location', :with => 'corner of 6th NE and kent NE'
    fill_in 'Pickup Time Mon-Fri', :with => '12:30'
    fill_in 'Pickup Time Sat', :with => '14:30'
    fill_in 'Description', :with => "it's blue and beautiful"
    click_button 'Create Mailbox'
    page.should have_content('Mailbox created.')
  end
end