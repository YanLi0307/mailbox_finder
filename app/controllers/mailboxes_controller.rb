class MailboxesController < ApplicationController
  def index
    @mailboxes = Mailbox.all
  end

  def new
    @mailbox = Mailbox.new
    @mailbox.build_location
    # @mailbox.location.build

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

  def edit
    @mailbox = Mailbox.find(params[:id])
  end

  def update
    @mailbox = Mailbox.find(params[:id])
    if @mailbox.update_attributes(params[:mailbox])
      flash[:notice] = "Mailbox got updated!"
      redirect_to @mailbox
    else
      flash[:alert] = "Mailbox didn't was updated!"
      render :action => "edit"
    end
  end
end
#@purchase.build_sale
#@ticket = @project.tickets.build