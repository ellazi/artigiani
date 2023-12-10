require 'faker'
require 'date'

puts "Cleaning database..."
Event.destroy_all
User.destroy_all

puts "Creating users..."

10.times do |i|
  letter = ('a'..'z').to_a[i]
  User.create!(
    email: "#{letter}@haven.com",
    password: "111111",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.city,
    is_artisan: rand(0..1),
    description: Faker::Lorem.paragraph_by_chars,
  )
end

puts "Created #{User.count} users"

puts "Creating events..."

User.where(is_artisan: true).each do |user|
  3.times do |i|
    month = rand(1..12)
    day = rand(1..28)
    Event.create!(
      title: Faker::Tea.variety,
      description: Faker::Lorem.paragraph_by_chars,
      location: Faker::Address.street_address + ", " + Faker::Address.city + ", " + Faker::Address.country,
      start_time: DateTime.new(2024, month, day, 9, 0),
      end_time: DateTime.new(2024, month, day, 18, 0),
      user_id: user.id,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
    )
  end
end

puts "Created #{Event.count} events"

puts "Finished!"
