FactoryBot.define do
  factory :reservation do
    room
    reservation_from { Time.zone.today }
    reservation_to { Time.zone.today + 3}
    card_owner_email { 'owneremail@email.bla' }
  end
end
