require 'faker'

puts "Cleaning database..."
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
puts "Finished!"
