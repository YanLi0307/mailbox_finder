class MailboxesController < ApplicationController
  def index
    @mailboxes = Mailbox.all
  end
end
