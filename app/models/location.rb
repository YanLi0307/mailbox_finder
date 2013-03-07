class Location < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zip, :latitude, :longitude, :gmaps
  belongs_to :mailbox

  def to_s
    normalized_address
  end

  def gmaps4rails_address
    "#{self.address}, #{self.city}, United States#{',' + self.zip unless self.zip.blank?}"
  end

  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => :geocode?,
                  :address => "gmaps4rails_address", :normalized_address => "normalized_address",
                  :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!self.address.blank? && (self.latitude.blank? || self.longitude.blank?)) || self.address_changed?
  end

  #TODO make this a partial and move to controller
  def gmaps4rails_infowindow
    outstr = ["<p>#{gmaps4rails_address}</p>"]
    outstr << ("<p>#{mailbox.description}</p>" unless mailbox.description.blank?)
    outstr << ("<p>#{mailbox.pickup_time_m_f}</p>" unless mailbox.pickup_time_m_f.blank?)
    outstr << ("<p>#{mailbox.pickup_time_sat}</p>" unless mailbox.pickup_time_sat.blank?)
    outstr.join("\n")
  end
end
