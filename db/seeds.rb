# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Reset all data
Booking.destroy_all
Review.destroy_all
User.destroy_all
Property.destroy_all

# Crée une propriété
property = Property.create!(
  name: "Appartement charmant proche Futuroscope",
  description: "Appartament charmant au coeur de Chasseneuil du Poitou, proche de toutes commodités et à quelques minutes du Futuroscope.",
  address: "10 rue de l'Ancienne Poste, 86360 Chasseneuil du Poitou",
  price_per_night: 80,
  max_guests: 6
)

puts "🏡 Propriété créée : #{property.name}"

# Crée 10 utilisateurs avec booking et review
10.times do |i|
  user = User.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number
  )

  # Crée une réservation entre 1 semaine et 10 jours
  start_date = Faker::Date.between(from: 6.months.ago, to: 2.months.ago)
  end_date = start_date + rand(7..10).days

  booking = Booking.create!(
    user: user,
    property: property,
    start_date: start_date,
    end_date: end_date,
    status: "confirmed"
  )

  # Crée une review associée à la propriété
  Review.create!(
    user: user,
    property: property,
    rating: rand(3..5),
    comment: Faker::Lorem.sentence(word_count: 12)
  )

  puts "✅ Utilisateur #{i + 1} : #{user.name} avec réservation du #{start_date} au #{end_date}"
end

puts "🌱 Seed terminée !"
