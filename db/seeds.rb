require "json"
require "open-uri"
require 'faker'

url = "https://rebrickable.com/api/v3/lego/sets/?key=#{ENV['REBRICKABLE_API_KEY']}&theme_id=761"

# id 18, 158, 207 are star wars
# id 196 is castle
# 761 is ninjago
Booking.destroy_all
LegoSet.destroy_all
User.destroy_all




puts "Creating Users:"
user1 = User.create(email: "john@wayne.com", password: "1234567898")
user2 = User.create(email: "john@wick.com", password: "1234567898")

lego_ninjago_descriptions = [
  "A powerful mech with a golden sword and movable limbs, perfect for battling the Serpentine warriors.",
  "A majestic dragon with icy wings and a posable tail, freezing enemies with its chilling breath.",
  "A large, detailed marketplace with stalls, bridges, and hidden traps for thrilling adventures in Ninjago City.",
  "A powerful drill vehicle with large, rotating wheels, ideal for fighting the villains of the underworld.",
  "A fast jet with adjustable wings and missiles, perfect for aerial battles against the Sky Pirates.",
  "An epic set with a giant, flame-throwing sword and fire blasters, great for battling the Serpentine.",
  "A training ground with a waterfall, obstacles, and weapon stands to enhance the ninja skills.",
  "A massive fortress with lava pits, hidden traps, and a throne room for the evil Lord Garmadon.",
  "An exciting set with a training area where the ninjas can battle Master Chen and his followers.",
  "An impressive temple with a moving staircase, hidden rooms, and a forge for crafting new ninja weapons."
]

lego_sets_serialized = URI.open(url).read
lego_sets = JSON.parse(lego_sets_serialized)

puts "Creating LegoSets:"

lego_sets["results"].first(10).each do |lego_set|
  puts "Creating LegoSet: #{lego_set["name"]}"
  new_lego_set = LegoSet.create!(set_name: lego_set["name"], lego_nr: lego_set["set_num"].to_i, release_year: lego_set["year"].to_s + "-1-1", num_parts: lego_set["num_parts"], price_per_day: rand(1..10), user_id: User.all.sample.id, description: lego_ninjago_descriptions.sample) 
  # description: Faker::Lorem.sentence(word_count: rand(10..15)).chomp('.')
  new_lego_set.photo.attach(io: URI.open(lego_set["set_img_url"].to_s), filename: File.basename(lego_set["set_img_url"].to_s)) if lego_set["set_img_url"].present?
end

puts "Creating Bookings:"

available_lego_sets = LegoSet.where.not(user_id: user1.id)


Booking.create(status: "pending", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user1.id, lego_set: available_lego_sets.sample)
Booking.create(status: "rejected", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user1.id, lego_set: available_lego_sets.sample)
Booking.create(status: "canceled", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user1.id, lego_set: available_lego_sets.sample)

Booking.create(status: "pending", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user2.id, lego_set: user1.lego_sets.first)
Booking.create(status: "pending", rent_start: "2024-9-24", rent_end: "2024-9-27", user_id: user2.id, lego_set: user1.lego_sets.first)
