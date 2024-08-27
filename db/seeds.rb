require "json"
require "open-uri"

url = "https://rebrickable.com/api/v3/lego/sets/?key=#{ENV['REBRICKABLE_API_KEY']}"

User.destroy_all
LegoSet.destroy_all

puts "Creating Users:"
user1 = User.create(email: "johnd@wayne.com", password: "1234567898")
user2 = User.create(email: "john@wick.com", password: "1234567898")
user3 = User.create(email: "pocahontas@girl.com", password: "1234567898")
user4 = User.create(email: "hercules@strong.com", password: "1234567898")

lego_sets_serialized = URI.open(url).read
lego_sets = JSON.parse(lego_sets_serialized)

puts "Creating LegoSets:"

lego_sets["results"].each do |lego_set|
  puts "Creating LegoSet: #{lego_set["name"]}"
  LegoSet.create!(set_name: lego_set["name"], lego_nr: lego_set["set_num"].to_i, release_year: lego_set["year"].to_s + "-1-1", price_per_day: rand(1..10), user_id: User.all.sample.id,)
end

puts "Creating Bookings:"

# TODO: Create bookings
