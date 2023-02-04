# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Article.delete_all

require 'csv'

csv_text = File.read(Rails.root.join("lib", "seeds", "smart_meters.csv"))
csv = CSV.parse(csv_text, :headers =>true, :encoding => 'ISO-8859-1')

csv.each do |row|
  t = Article.new
  t.date = Date.strptime(row[0], "%d/%m/%Y")
  t.smart_gas_meters_in_smart_mode = row["smart_gas_meters_in_smart_mode"]
  t.smart_gas_meters_in_traditional_mode = row["smart_gas_meters_in_traditional_mode"]
  t.non_smart_gas_meters = row["non_smart_gas_meters"]
  t.smart_electricity_meters_in_smart_mode = row["smart_electricity_meters_in_smart_mode"]
  t.smart_electricity_meters_in_traditional_mode = row["smart_electricity_meters_in_traditional_mode"]
  t.non_smart_electricity_meters = row["non_smart_electricity_meters"]
  t.all_smart_meters_in_smart_mode = row["all_smart_meters_in_smart_mode"]
  t.all_smart_meters_in_traditional_mode = row["all_smart_meters_in_traditional_mode"]
  t.all_non_smart_meters = row["all_non_smart_meters"]
  t.total_meters = row["total_meters"]
  t.save
end