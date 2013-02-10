class Mailbox < ActiveRecord::Base
  attr_accessible :description, :pickup_time_m_f, :pickup_time_sat
end
