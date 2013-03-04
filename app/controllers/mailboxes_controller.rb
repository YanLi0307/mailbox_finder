class MailboxesController < ApplicationController
  before_filter :find_mailbox, :only => [:show, :edit, :update]
  before_filter :find_json_for_maps, :only => [:show, :edit]
  def index
    @mailboxes = Mailbox.all
    @json = @mailboxes.map(&:location).to_gmaps4rails
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
  end

  def edit
  end

  def update
    if @mailbox.update_attributes(params[:mailbox])
      flash[:notice] = "Mailbox got updated!"
      redirect_to @mailbox
    else
      flash[:alert] = "Mailbox didn't was updated!"
      render :action => "edit"
    end
  end

  private
  def find_mailbox
    @mailbox = Mailbox.find(params[:id])
  end

  def find_json_for_maps
    @json = @mailbox.location.to_gmaps4rails
  end
end
#@purchase.build_sale
#@ticket = @project.tickets.build
