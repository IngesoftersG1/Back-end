# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180517225652) do
  
  create_table "anuncios", force: :cascade do |t|
    t.string "tipo"
    t.integer "equipo_id"
    t.string "user_id"
    t.integer "torneo_id"
    t.string "enlace"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.text "descripcion"
    t.text "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tablon_id"
    t.index ["tablon_id"], name: "index_anuncios_on_tablon_id"
    t.index ["user_id"], name: "index_anuncios_on_user_id"
  end

  create_table "canchas", force: :cascade do |t|
    t.boolean "disponibilidad"
    t.integer "precio"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ubicacion_id"
    t.string "nombre"
    t.index ["ubicacion_id"], name: "index_canchas_on_ubicacion_id"
    t.index ["user_id"], name: "index_canchas_on_user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "deportes", force: :cascade do |t|
    t.text "descripcion"
    t.integer "min_jugadores"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
  end

  create_table "equipos", force: :cascade do |t|
    t.string "nombre"
    t.integer "nivel"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deporte_id"
    t.string "capitan_name"
    t.index ["capitan_name"], name: "index_equipos_on_capitan_name"
    t.index ["deporte_id"], name: "index_equipos_on_deporte_id"
  end

  create_table "equipos_torneos", id: false, force: :cascade do |t|
    t.integer "equipo_id", null: false
    t.integer "torneo_id", null: false
    t.index ["equipo_id"], name: "index_equipos_torneos_on_equipo_id"
    t.index ["torneo_id"], name: "index_equipos_torneos_on_torneo_id"
  end

  create_table "equipos_users", id: false, force: :cascade do |t|
    t.string "user_id", null: false
    t.integer "equipo_id", null: false
    t.index ["equipo_id"], name: "index_equipos_users_on_equipo_id"
    t.index ["user_id"], name: "index_equipos_users_on_user_id"
  end

  create_table "estadisticas", force: :cascade do |t|
    t.integer "partidos_ganados"
    t.integer "partidos_perdidos"
    t.integer "partidos_empatados"
    t.integer "puntos_ganados"
    t.integer "goles_anotados"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.integer "equipo_id"
    t.index ["equipo_id"], name: "index_estadisticas_on_equipo_id"
    t.index ["user_id"], name: "index_estadisticas_on_user_id"
  end

  create_table "google_users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "mensajes", force: :cascade do |t|
    t.text "contenido"
    t.string "user_id"
    t.date "fecha"
    t.text "asunto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "usuario_2_name"
    t.boolean "read"
    t.index ["user_id"], name: "index_mensajes_on_user_id"
    t.index ["usuario_2_name"], name: "index_mensajes_on_usuario_2_name"
  end

  create_table "partidos", force: :cascade do |t|
    t.date "fecha"
    t.integer "ubicacion_id"
    t.integer "deporte_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "played"
    t.integer "equipo_local_id"
    t.integer "equipo_visitante_id"
    t.integer "marcador_local"
    t.integer "marcador_visitante"
    t.boolean "jugado"
    t.index ["deporte_id"], name: "index_partidos_on_deporte_id"
    t.index ["ubicacion_id"], name: "index_partidos_on_ubicacion_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "user_id"
    t.integer "equipo_id"
    t.integer "torneo_id"
    t.string "request_type"
    t.boolean "read"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tablons", force: :cascade do |t|
    t.string "titulo_tablon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "torneos", force: :cascade do |t|
    t.date "fecha"
    t.string "premio"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deporte_id"
    t.string "organizador_name"
    t.integer "ubicacion_id"
    t.string "nombre"
    t.index ["deporte_id"], name: "index_torneos_on_deporte_id"
    t.index ["organizador_name"], name: "index_torneos_on_organizador_name"
    t.index ["ubicacion_id"], name: "index_torneos_on_ubicacion_id"
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string "calle_principal"
    t.string "calle_secundaria"
    t.string "localidad"
    t.string "ciudad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.date "fecha_nacimiento"
    t.integer "telefono"
    t.string "email"
    t.string "num_deportes"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ubicacion_id"
    t.string "user_name"
    t.string "password_digest"
    t.boolean "admin"
    t.string "picture"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.index ["ubicacion_id"], name: "index_users_on_ubicacion_id"
  end

end
