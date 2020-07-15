require_relative '../config/environment' 

puts "...destroying"
Recipe.destroy_all

puts "...creating"
r1 = Recipe.create(name: "test name", ingredients: "chocolate", cook_time: "1 hour")
r2 = Recipe.create(name: "le cake", ingredients: "vanilla", cook_time: "5 hours")

puts "done!"