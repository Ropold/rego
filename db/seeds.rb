# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
LegoSet.create(set_name: 'lego', lego_nr: '5785', release_year: "2018-04-01", price_per_day: "100")
LegoSet.create(set_name: 'set', lego_nr: "6033", release_year: "2022-08-01", price_per_day: "35")
LegoSet.create(set_name: 'leg', lego_nr: "2243", release_year: "2014-02-21", price_per_day: "25")
LegoSet.create(set_name: 'water', lego_nr: "3043", release_year: "2019-03-01", price_per_day: "20")
