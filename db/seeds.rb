require 'faker'
require 'open-uri'

puts "Cleaning database..."
EventUser.destroy_all
Event.destroy_all
Favourite.destroy_all
User.destroy_all
Item.destroy_all

puts "Creating users..."

total_users = 20
total_artisans = 6

total_users.times do |i|
  letter = ('a'..'z').to_a[i]
  # random_num = rand(1..6)

  user = User.create!(
    email: "#{letter}@artigiani.com",
    password: "111111",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_artisan: i < total_artisans ? 1 : 0,
    company: i < total_artisans ? User::ARTISANS[i] : nil,
    description: i < total_artisans ? User::DESCRIPTIONS[i] : nil,
    location: i < total_artisans ? User::ADDRESSES[i] : nil,
  )
end

puts "Created #{User.count} users"

artisans = User.where(is_artisan: true)

n = 1
artisans.each do |user|
  user.photo.attach(io: File.open("app/assets/images/artisan_#{n}.jpg"), filename: "artisan_#{n}.jpg", content_type: 'image/jpeg')
  n += 1
end

puts "Creating events..."

12.times do |i|
    month = rand(1..12)
    day = rand(1..28)
    starting_time = rand(9..18)
    ending_time = starting_time + rand(1..4)
    event = Event.create!(
      title: Event::TITLES[i],
      description: Event::DESCRIPTIONS[i],
      location: Event::LOCATIONS[i],
      start_time: Time.new(2024, month, day, starting_time),
      end_time: Time.new(2024, month, day, ending_time),
      # latitude: Faker::Address.latitude,
      # longitude: Faker::Address.longitude,
    )
  end

puts "Create event users..."

events = Event.all

artisans.each do |user|
  events.sample(2).each do |event|
    EventUser.create!(event: event, user: user)
  end
end

# artisans.each do |user|
#   2.times do |i|
#     Event.all.each do |event|
#       EventUser.create!(event: event, user: user)
#     end
#   end
# end

puts "Created #{Event.count} events"

puts "Creating items..."

artisans.each do |user|
  7.times do |i|
    item = Item.create!(
      name: Faker::Coffee.blend_name,
      description: Faker::Lorem.paragraph_by_chars,
      price: rand(1..100),
      user_id: user.id,
    )
    file = URI.open('https://source.unsplash.com/600x600/?clothes')
    item.photos.attach(io: file, filename: item.name, content_type: 'image/png')
    item.save!
  end
end

puts "Created #{Item.count} items"

puts "Creating favourites..."

User.where(is_artisan: false).each do |user|
  3.times do |i|
    favourite = Favourite.create!(
      user_id: user.id,
      item_id: Item.all.sample.id,
    )
  end
end

puts "Finished!"
