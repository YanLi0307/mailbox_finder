class Location < ActiveRecord::Base
  attr_accessible :address, :state, :zip
  belongs_to :mailbox

end
