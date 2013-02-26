class Location < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zip, :latitude, :longitude, :gmaps
  belongs_to :mailbox

  def to_s
    "#{address}, #{city}, #{state}, United States, #{zip}"
  end

  # acts_as_gmappable
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.city}, United States, #{self.zip}"
  end

  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => :geocode?,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!self.address.blank? && (self.latitude.blank? || self.longitude.blank?)) || self.address_changed?
  end
end
