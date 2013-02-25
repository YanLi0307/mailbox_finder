class Location < ActiveRecord::Base
  attr_accessible :address, :state, :zip
  belongs_to :mailbox

  def to_s
    "#{address}\n#{state} #{zip}"
  end
end
