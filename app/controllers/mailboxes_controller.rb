class MailboxesController < ApplicationController
  def index
    @mailboxes = Mailbox.all
  end

  def new
    @mailbox = Mailbox.new
  end

  def create
    @mailbox = Mailbox.new(params[:mailbox])
    if @mailbox.save
      flash[:notice] = "Mailbox got made."
      redirect_to @mailbox
    else
      flash[:alert] = "Mailbox ain't made!"
      render :action => "new"
    end
  end

  def show
    @mailbox = Mailbox.find(params[:id])
  end
end
