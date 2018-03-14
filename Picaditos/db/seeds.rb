# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
100.times do |row|
    Ubicacion.create(
    calle_principal: Faker::Address.building_number,     
    calle_secundaria: Faker::Address.building_number,
    ciudad: Faker::Address.city
    )
end


100.times do |row|
  Usuario.create(
  user_name: Faker::LeagueOfLegends.champion,    
  nombres: Faker::Name.first_name,
  apellidos: Faker::Name.last_name,
  correo_electronico: Faker::Internet.email, 
  fecha_nacimiento: Faker::Date.backward(23_725),
  telefono: Faker::PhoneNumber.subscriber_number,
  ubicacion_id: Faker::Number.number(3)
  )
end

