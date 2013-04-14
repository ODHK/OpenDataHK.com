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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130412203954) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.text     "announcement"
    t.text     "recap"
    t.string   "organiser"
    t.string   "logo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "serie_id"
    t.integer  "location_id"
  end

  add_index "events", ["location_id"], :name => "index_events_on_location_id"
  add_index "events", ["serie_id"], :name => "index_events_on_serie_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.text     "details"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "cover"
    t.integer  "lead"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "tags"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "series", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "github"
    t.string   "googleplus"
    t.string   "facebook"
    t.boolean  "mailinglist"
    t.string   "location"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
