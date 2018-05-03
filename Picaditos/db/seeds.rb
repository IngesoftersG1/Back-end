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
      deporte_id: ((i+1) % 3)+1,
      premio: "Una patada en el culo"
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

def seedCanchas
  print("================= SeedingDB:  Creating Canchas =======================\n")
  Cancha.create(
    disponibilidad: true,
    precio: 20000,
    calificacion: 3,
    ubicacion_id: 1,
    user_id: 1,
    nombre: "5 site"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 2,
    user_id: 2,
    nombre: "Kick 5"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 3,
    user_id: 3,
    nombre: "Cancha La Carbonera"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 4,
    user_id: 4,
    nombre: "Campín 5"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 5,
    user_id: 5,
    nombre: "Fabian Vargas Indoor"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 6,
    user_id: 6,
    nombre: "Estadio 57"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 7,
    user_id: 7,
    nombre: "Fabian Vargas Indoor II"
  )
  
  Cancha.create(
    disponibilidad: true,
    precio: 150000,
    calificacion: 4,
    ubicacion_id: 8,
    user_id: 8,
    nombre: "CANCHAS FUTBOL 5 Y 8 WEMBLEY"
  )
  
end

def seedUbicacions
  print("================= SeedingDB:  Creating Ubications =====================\n")
  Ubicacion.create(
    calle_principal: "4.630527",
    calle_secundaria: "-74.126913",
    localidad: "Kennedy",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.636792",
    calle_secundaria: "-74.063280",
    localidad: "Chapinero",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.653351",
    calle_secundaria: "-74.078599",
    localidad: "Chapinero",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.652106",
    calle_secundaria: "-74.077324",
    localidad: "Chapinero",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.649956",
    calle_secundaria: "-74.066264",
    localidad: "Chapinero",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.642958",
    calle_secundaria: "-74.061850",
    localidad: "Chapinero",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.651593",
    calle_secundaria: "-74.065312",
    localidad: "Chapinero",
    ciudad: "Bogotá"
  )
  
  Ubicacion.create(
    calle_principal: "4.636573",
    calle_secundaria: "-74.097294",
    localidad: "Teusaquillo",
    ciudad: "Bogotá"
  )
end

seedTeams
seedTorneos
seedDeportes
seedAdmin
seedTablons
seedAnuncios
seedCanchas
seedUbicacions