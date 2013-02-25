class Mailbox < ActiveRecord::Base
  attr_accessible :description, :pickup_time_m_f, :pickup_time_sat, :location_attributes

  has_one :location

  accepts_nested_attributes_for :location

  acts_as_gmappable
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.location.address}, #{self.location.city}, US, #{self.location.zip}"
  end

  # acts_as_gmappable :lat => 'lat', :lng => 'lng', :process_geocoding => :geocode?,
  #                 :address => "address", :normalized_address => "address",
  #                 :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!location.address.blank? && (location.lat.blank? || location.lng.blank?)) || location.address_changed?
  end
end
