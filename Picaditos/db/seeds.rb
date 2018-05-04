# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def seedTeams
  for i in 1..20 do
    print("================= SeedingDB:  Creating Team ",i," =======================\n")
    print("================= SeedingDB:  Creating Captain for Team ",i," =======================\n")
    user = User.new
    user_name=Faker::LeagueOfLegends.champion
    user.user_name = user_name
    user.password = '1234567'
    user.password_confirmation = '1234567'
    user.email =  Faker::Internet.email
    user.nombres = Faker::Name.first_name
    user.apellidos = Faker::Name.last_name
    user.fecha_nacimiento = Faker::Date.backward(23_725)
    user.telefono = Faker::PhoneNumber.subscriber_number
    user.ubicacion_id= Faker::Number.number(3)
    user.save

    print("================= SeedingDB:  Create statistics for users ",i," =======================\n")
    Estadistica.create(
      user_id: user_name,
      partidos_ganados: Faker::Number.between(6, 8),
      partidos_perdidos: Faker::Number.between(3, 5),
      partidos_empatados: Faker::Number.between(3, 4),
      goles_anotados: Faker::Number.between(11,17)
    )

    EquiposUsers.create(
        user_id: user_name,
        equipo_id: i
      )
    print("=== Captain user name: ",user_name," ===\n")
    team_name = Faker::RockBand.name
      Equipo.create(
        nombre: Faker::RockBand.name,
        nivel: Faker::Number.between(1, 10),
        capitan_name: user_name,
        deporte_id: (i % 3)+1
      )
    print("=== Team name: ",team_name," ===\n")
    print("================= SeedingDB:  Creating other players for Team ",i," =======================\n")
    for j in 1..7 do
    user_name=Faker::LeagueOfLegends.champion
    user = User.new
    user.user_name = user_name
    user.password = '1234567'
    user.password_confirmation = '1234567'
    user.email =  Faker::Internet.email
    user.nombres = Faker::Name.first_name
    user.apellidos = Faker::Name.last_name
    user.fecha_nacimiento = Faker::Date.backward(23_725)
    user.telefono = Faker::PhoneNumber.subscriber_number
    user.ubicacion_id= Faker::Number.number(3)
    user.save
    print("=== Other players:",user_name," ===\n")
    EquiposUsers.create(
        user_id: user_name,
        equipo_id: i
      )
    print("================= SeedingDB:  Create statistics for users ",i," =======================\n")
    Estadistica.create(
        user_id: user_name,
        partidos_ganados: Faker::Number.between(6, 8),
        partidos_perdidos: Faker::Number.between(3, 5),
        partidos_empatados: Faker::Number.between(3, 4),
        goles_anotados: Faker::Number.between(11,17)
    )
    end
  end
end



def seedTorneos
  for i in 0..4 do
    print("================= SeedingDB:  Creating Torneo ",(i+1)," =======================\n")
    torneo_name = Faker::Pokemon.name
    user_name = Faker::LeagueOfLegends.champion
    print("=== Torneo name: ",torneo_name," ===\n")
    print("=== Organizador name: ",user_name," ===\n")
    Torneo.create(
      fecha: Faker::Date.between(2.days.ago, Date.today),
      nombre: Faker::RockBand.name,
      organizador_name: user_name,
      user_id: user_name,
      deporte_id: ((i+1) % 3)+1,
      premio: "Play Station 4"
    )

    print("================= SeedingDB:  Signing up Teams in Tournament ",(i+1)," =======================\n")
    for j in 1..4 do
    EquiposTorneos.create(
        equipo_id: j+(i*4),
        torneo_id: i+1,
      )
    equipo=Equipo.find(j+(i*4))
    print("=== ",equipo.nombre," signed up in ",torneo_name," ===\n")
    end

  end
end

def seedDeportes
  print("================= SeedingDB:  Creating Deportes =======================\n")
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

end

def seedAdmin
  print("================= SeedingDB:  Creating Admin user =======================\n")
  user = User.new
  user.user_name = 'Ingesofters'
  user.password = 'se201811'
  user.password_confirmation = 'se201811'
  user.email =  'me@unal.edu.co'
  user.nombres = 'Ingesofters'
  user.apellidos = 'G'
  user.admin = true
  user.fecha_nacimiento = Faker::Date.backward(23_725)
  user.telefono = Faker::PhoneNumber.subscriber_number
  user.ubicacion_id= Faker::Number.number(3)
  user.save
end

def seedTablons
  print("================= SeedingDB:  Creating tablons =======================\n")
  Tablon.create(
    titulo_tablon: "Torneos",
    )


    Tablon.create(
    titulo_tablon: "Clasificados",
    )





end


def seedAnuncios
  print("================= SeedingDB:  Creating Anuncios =======================\n")
  5.times do |row|
    Anuncio.create(
      tipo: "Clasificado",
      enlace: Faker::Internet.url('picaditos.com'),
      fecha_inicio: Faker::Date.between(2.days.ago, Date.today),
      fecha_fin: (Date.today),
      user_id: Faker::LeagueOfLegends.champion,
      tablon_id: 2,
      descripcion: "----"
    )
    end

    5.times do |row|
      Anuncio.create(
        tipo: "Torneo",
        enlace: Faker::Internet.url('picaditos.com'),
        fecha_inicio: Faker::Date.between(2.days.ago, Date.today),
        fecha_fin: (Date.today),
        user_id: Faker::LeagueOfLegends.champion,
        tablon_id: 1,
        descripcion: "----"
      )
      end

end

def seedEstadisticas
  print("================= SeedingDB:  Creating Estadisticas for jugadores =======================\n")
  10.times do |row|
    Estadistica.create(
      user_id: Faker::LeagueOfLegends.champion,
      partidos_ganados: Faker::Number.between(1, 10),
      partidos_perdidos: Faker::Number.between(1, 10),
      partidos_empatados: Faker::Number.between(1, 10),
      goles_anotados: Faker::Number.between(1, 30)
    )
    end
  print("================= SeedingDB:  Creating Estadisticas for equipos =======================\n")
    for j in 1..4 do
      Estadistica.create(
        equipo_id: j,
        partidos_ganados: Faker::Number.between(1, 10),
        partidos_perdidos: Faker::Number.between(1, 10),
        partidos_empatados: Faker::Number.between(1, 10),
        goles_anotados: Faker::Number.between(1, 30)
      )
    end
    Estadistica.create(
      user_id: "David Eduardo",
      partidos_ganados: 7,
      partidos_perdidos: 4,
      partidos_empatados: 3,
      goles_anotados: 19
    )

end


seedEstadisticas
seedTeams
seedTorneos
seedDeportes
seedAdmin
seedTablons
seedAnuncios
