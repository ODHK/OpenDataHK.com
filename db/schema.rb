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

ActiveRecord::Schema.define(:version => 20130824125341) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.text     "announcement"
    t.text     "recap"
    t.string   "organiser"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "serie_id"
    t.integer  "location_id"
    t.string   "facebook"
    t.string   "google_plus"
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

  create_table "microbes", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "role",       :default => "member"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "cover"
    t.string   "url"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "stage",       :default => "proposal"
    t.string   "github_user", :default => "ODHK"
    t.string   "github_repo"
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
    t.string   "email"
    t.string   "github"
    t.string   "googleplus"
    t.string   "facebook"
    t.boolean  "mailinglist"
    t.string   "location"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "twitter"
    t.string   "avatar"
    t.string   "company"
    t.string   "blog"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
