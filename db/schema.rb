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

ActiveRecord::Schema.define(:version => 20101108184115) do

  create_table "google_sheets", :force => true do |t|
    t.string   "key"
    t.string   "sheettype"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "headerrow"
    t.string   "classname"
  end

  create_table "point_tags", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "point_id"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "version"
    t.integer  "user_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_point_tags", :force => true do |t|
    t.integer  "route_id"
    t.integer  "point_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
  end

  create_table "route_points", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "point_id"
    t.integer  "route_id"
    t.integer  "version"
  end

  create_table "route_tags", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.string   "value"
    t.integer  "route_id"
    t.integer  "version"
  end

  create_table "routes", :force => true do |t|
    t.integer  "version"
    t.integer  "user_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_schedules", :force => true do |t|
    t.string   "fromloc"
    t.string   "toloc"
    t.string   "transporttype"
    t.string   "departuretimes"
    t.string   "dayofweek"
    t.float    "cost"
    t.string   "currency"
    t.string   "estimatedtraveltime"
    t.string   "departinglocation"
    t.string   "arrivinglocation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_tags", :force => true do |t|
    t.integer  "tag_id"
    t.string   "key"
    t.string   "value"
    t.integer  "version"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "version"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
