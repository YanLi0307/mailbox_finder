FactoryGirl.define do
  factory :mailbox do
    description "Test Mailbox"
  end

  factory :location do
    street_one "6th NE"
    street_two "Kent NE"
    zip '99999'
    city "Auburn"
    state 'WA'
    mailbox
  end
end