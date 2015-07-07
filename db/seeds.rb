# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.fir
Product.destroy_all
 100.times do |i|
 	Product.create(name:"producto #{i}",
 		description: "Descripcion generica",
 		price:100)
end