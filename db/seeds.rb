# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'email@email.emial', password: 'qwerasdf', f_name: 'first_name', l_name: 'lastname')
company = Company.create( name: 'Company', p_number: 1234, address: 'Why not', company_email: 'emailwothout@', company_serial: 123, user: user)
country = Country.create( name: 'Neverpastbedtime land', abbreviation: 'Nl')
city = City.create( name: 'I ame city', post_code: 'bla124b', country: country)
hotel = Hotel.create( name: 'tithfs', stars: 2, description: 'This is test hotel for seeds', company: company, city: city)
10.times { |i| Room.create(name: "Room ##{i}", price: i*10, description: "This is room number #{i}", hotel: hotel, available_from: Time.zone.today, available_to: Time.zone.today + 30 ) }

10.times do |i|
  Hotel.create(name: "Hotel ##{i}", stars: rand(1..5), description: 'This is test hotel for seeds', company: company, city: city)
end
