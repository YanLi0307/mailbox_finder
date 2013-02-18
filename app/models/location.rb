class Location < ActiveRecord::Base
  attr_accessible :address, :state, :zip
  belongs_to :mailbox

  # def gmaps4rails_address
  #   #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  #   "#{self.address}, #{self.city}, US, #{self.zip}"
  # end

  acts_as_gmappable :lat => 'lat', :lng => 'lng', :process_geocoding => :geocode?,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!address.blank? && (lat.blank? || lng.blank?)) || address_changed?
  end
end
