require "json"
require "open-uri"

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


lego_sets_serialized = URI.open(url).read
lego_sets = JSON.parse(lego_sets_serialized)

puts "Creating LegoSets:"

lego_sets["results"].first(10).each do |lego_set|
  puts "Creating LegoSet: #{lego_set["name"]}"
  new_lego_set = LegoSet.create!(set_name: lego_set["name"], lego_nr: lego_set["set_num"].to_i, release_year: lego_set["year"].to_s + "-1-1", price_per_day: rand(1..10), user_id: User.all.sample.id)
  new_lego_set.photo.attach(io: URI.open(lego_set["set_img_url"].to_s), filename: File.basename(lego_set["set_img_url"].to_s)) if lego_set["set_img_url"].present?
end

puts "Creating Bookings:"

available_lego_sets = LegoSet.where.not(user_id: user1.id)


Booking.create(status: "pending", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user1.id, lego_set: available_lego_sets.sample)
Booking.create(status: "rejected", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user1.id, lego_set: available_lego_sets.sample)
Booking.create(status: "canceled", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user1.id, lego_set: available_lego_sets.sample)

Booking.create(status: "pending", rent_start: "2024-8-24", rent_end: "2024-8-27", user_id: user2.id, lego_set: user1.lego_sets.first)
Booking.create(status: "pending", rent_start: "2024-9-24", rent_end: "2024-9-27", user_id: user2.id, lego_set: user1.lego_sets.first)
