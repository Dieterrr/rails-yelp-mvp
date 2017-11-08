# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Coffee.blend_name,
    address: ["Amsterdam", "Paris", "London", "Shanghai", "Tokio", "Belgrade"].sample,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  restaurant.save!
  5.times do
    review = Review.new(
      restaurant: restaurant,
      content: Faker::TwinPeaks.quote,
      rating: (1..5).to_a.sample
      )
    review.save!
  end
end

puts 'Finished!'

  # {
  #   name:         "Epicure au Bristol",
  #   address:      "112 rue du Fg St-Honoré 75008 Paris",
  #   description:  "Face au jardin, on découvre une salle lumineuse... et la cuisine d'Éric Frechon.",
  #   stars:        3
  # },
  # {
  #   name:         "La truffière",
  #   address:      "4 rue Blainville 75005 Paris",
  #   description:  "Une valeur sûre que cette belle maison du 17e et les recettes de Jean-Christophe Rizet",
  #   stars:        1
  # },
  # {
  #   name:         "Le pré catelan",
  #   address:      "route de Suresnes 75016 Paris",
  #   description:  "Oeil vif, geste sûr: impossible de distinguer, dans les créations de Frédéric Anton...",
  #   stars:        3
  # }
