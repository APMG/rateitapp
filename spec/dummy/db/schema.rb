# encoding: UTF-8
# frozen_string_literal: true
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

ActiveRecord::Schema.define(version: 20_160_614_215_245) do
  create_table 'rateitapp_ratings', force: :cascade do |t|
    t.integer  'value',        limit: 4,   null: false
    t.string   'ratable_type', limit: 255, null: false
    t.string   'ratable_id',   limit: 255, null: false
    t.integer  'user_id',      limit: 4,   null: false
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  add_index 'rateitapp_ratings', %w(user_id ratable_type ratable_id), name: 'primary_composite_key_index', unique: true, using: :btree
end
