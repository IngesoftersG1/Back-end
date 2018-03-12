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

ActiveRecord::Schema.define(version: 20180312194853) do

  create_table "anuncios", force: :cascade do |t|
    t.string "tipo"
    t.string "enlace"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canchas", force: :cascade do |t|
    t.binary "disponibilidad"
    t.integer "precio"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.integer "ubicacion_id"
    t.index ["ubicacion_id"], name: "index_canchas_on_ubicacion_id"
    t.index ["usuario_id"], name: "index_canchas_on_usuario_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.text "contenido"
    t.integer "usuario_id"
    t.date "fecha"
    t.text "asunto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_mensajes_on_usuario_id"
  end

  create_table "equipos", force: :cascade do |t|
    t.string "nombre"
    t.integer "nivel"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estadisticas", force: :cascade do |t|
    t.integer "partidos_ganados"
    t.integer "partidos_perdidos"
    t.integer "partidos_empatados"
    t.integer "puntos_ganados"
    t.integer "goles_anotados"
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
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string "calle_principal"
    t.string "calle_secundaria"
    t.string "localidad"
    t.string "ciudad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "tipo_de_documento"
    t.string "nombres"
    t.string "apellidos"
    t.date "fecha_nacimiento"
    t.integer "telefono"
    t.string "correo_electronico"
    t.string "num_deportes"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ubicacion_id"
    t.index ["ubicacion_id"], name: "index_usuarios_on_ubicacion_id"
  end

end
