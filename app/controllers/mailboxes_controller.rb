class MailboxesController < ApplicationController
  before_filter :find_mailbox, :only => [:show, :edit, :update]
  before_filter :find_json_for_maps, :only => [:show, :edit]

  INITIAL_SEARCH_RADIUS_MILES = 10
  DISTANCE_MULTIPLIER = 3

  def index
    if params[:search]
      find_nearest_mailboxes(params[:search], INITIAL_SEARCH_RADIUS_MILES, 1)
    else
      @mailboxes = Mailbox.all
    end
      @json = @mailboxes.map(&:location).to_gmaps4rails
  end

  def new
    @mailbox = Mailbox.new
    @mailbox.build_location
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

  # attempt to locate the nearest mailbox(es)
  # recursively calls itself with greater and greater radii until at least one mailbox is returned
  def find_nearest_mailboxes(search, distance, depth)
    location = Location.near(search, distance, :order => :distance)
    if !location.empty?
      if depth > 1
        flash[:notice] = 'No Mailboxes found very close to you; search area expanded.'
      end
      @mailboxes = location.map(&:mailbox).compact
    else
      sleep(0.5)
      find_nearest_mailboxes(search, distance * DISTANCE_MULTIPLIER, depth + 1)
    end
  end
end
