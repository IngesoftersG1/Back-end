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

Tablon.create(
titulo_tablon: "Torneos",
)

5.times do |row|
Anuncio.create(
  tipo: "Torneo",
  enlace: Faker::Internet.url('picaditos.com'),
  fecha_inicio: Faker::Date.between(2.days.ago, Date.today),
  fecha_fin: (Date.today),
  usuario_id: Faker::LeagueOfLegends.champion, 
  tablon_id: 1,
  descripcion: "----"
)
end

Tablon.create(
titulo_tablon: "Clasificados",
)

5.times do |row|
Anuncio.create(
  tipo: "Clasificado",
  enlace: Faker::Internet.url('picaditos.com'),
  fecha_inicio: Faker::Date.between(2.days.ago, Date.today),
  fecha_fin: (Date.today),
  usuario_id: Faker::LeagueOfLegends.champion, 
  tablon_id: 2,
  descripcion: "----"
)
end

Deporte.create(
nombre: "Futbol",
descripcion: "22 pelotas corriendo detras de otra",
min_jugadores: 11  
)


Deporte.create(
nombre: "Microfutbol",
descripcion: "10 pelotas corriendo detras de otra",
min_jugadores: 5  
)


Deporte.create(
nombre: "Baloncesto",
descripcion: "Deporte que requiere altura y melanina",
min_jugadores: 5  
)


5.times do |row|
  Equipo.create(
    nombre: Faker::RockBand.name,
    nivel: Faker::Number.between(1, 10),
    capitan_name: Faker::LeagueOfLegends.champion,
    deporte_id: 1
  )
end
5.times do |row|
  Equipo.create(
    nombre: Faker::RockBand.name,
    nivel: Faker::Number.between(1, 10),
    capitan_name: Faker::LeagueOfLegends.champion,
    deporte_id: 2
  )
end
5.times do |row|
  Equipo.create(
    nombre: Faker::RockBand.name,
    nivel: Faker::Number.between(1, 10),
    capitan_name: Faker::LeagueOfLegends.champion,
    deporte_id: 3
  )
end

