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

ActiveRecord::Schema.define(version: 20131126232349) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", force: true do |t|
    t.text     "content"
    t.string   "line_type"
    t.integer  "position"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scene_id"
  end

  create_table "scenes", force: true do |t|
    t.string   "description"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

end
