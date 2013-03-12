require 'csv'

namespace :mailboxes do
  errors = 0
  success = 0
  task :import => :environment do
    (1..1).each do |csv|
      CSV.foreach("data/mailboxes#{csv}.csv") do |row|
        location = Location.find_or_initialize_by_address row[1]
        next if location.latitude.present?

        if location.new_record?
          location.mailbox = Mailbox.new
        end

        location.mailbox.description = row[2]
        location.mailbox.pickup_time_m_f = row[8]
        location.mailbox.pickup_time_sat = row[9]

        location.zip = row[0][0..4]
        location.city = row[3]
        location.state = row[4]

        begin
          sleep 5
          location.save!
        rescue ActiveRecord::RecordInvalid => ex
          ap ex
          ap location
          errors += 1
        rescue ActiveRecord::StatementInvalid => ex
          ap ex
          ap location
          success += 1
        end
      end
    end
    ap "errors: #{errors}"
    ap "successes: #{success}"
  end
end

 # [ 0] "9992900000",
 #    [ 1] "112 FEDERAL WAY",
 #    [ 2] "WRANGELL POST OFFICE",
 #    [ 3] "WRANGELL",
 #    [ 4] "AK",
 #    [ 5] "MIXED",
 #    [ 6] "STANDARD",
 #    [ 7] "P",
 #    [ 8] "1400",
 #    [ 9] "1400",
 #    [10] nil,
 #    [11] "20050108"