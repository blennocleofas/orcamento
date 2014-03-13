# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140201033026) do

  create_table "aereos", force: true do |t|
    t.string   "voo"
    t.string   "cia"
    t.string   "ida"
    t.string   "volta"
    t.string   "obs"
    t.string   "duracao"
    t.string   "tarifa"
    t.string   "taxa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "orca_id"
    t.string   "origem"
    t.string   "destino"
  end

  add_index "aereos", ["orca_id"], name: "index_aereos_on_orca_id", using: :btree

  create_table "aeroportos", force: true do |t|
    t.string   "cod"
    t.string   "lat"
    t.string   "lon"
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "woeid"
    t.string   "tz"
    t.string   "phone"
    t.string   "type"
    t.string   "email"
    t.string   "url"
    t.string   "runway_length"
    t.string   "elev"
    t.string   "icao"
    t.string   "direct_flights"
    t.string   "carriers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atendimentos", force: true do |t|
    t.string   "nome_completo"
    t.string   "origem"
    t.string   "destino"
    t.string   "tipo"
    t.string   "adultos"
    t.string   "criancas"
    t.string   "nenem"
    t.string   "data_ida"
    t.string   "data_volta"
    t.string   "data_compra"
    t.string   "data_retorno_contato"
    t.string   "telefone"
    t.string   "email"
    t.string   "obs"
    t.string   "status_fila"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
  end

  add_index "atendimentos", ["cliente_id"], name: "index_atendimentos_on_cliente_id", using: :btree

  create_table "cia", force: true do |t|
    t.string   "nome"
    t.string   "cod"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
  end

  create_table "clientes", force: true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.integer  "orca_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "telefone"
  end

  add_index "clientes", ["orca_id"], name: "index_clientes_on_orca_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "hotels", force: true do |t|
    t.string  "nome"
    t.string  "foto"
    t.string  "tipo"
    t.integer "orca_id"
    t.date    "data_ida"
    t.date    "data_volta"
  end

  add_index "hotels", ["orca_id"], name: "index_hotels_on_orca_id", using: :btree

  create_table "orcas", force: true do |t|
    t.string   "titulo"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "orcas", ["cliente_id"], name: "index_orcas_on_cliente_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

end
