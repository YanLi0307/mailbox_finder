class Mailbox < ActiveRecord::Base
  attr_accessible :description, :pickup_time_m_f, :pickup_time_sat, :location_attributes

  has_one :location

  accepts_nested_attributes_for :location
end
