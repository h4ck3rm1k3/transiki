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

ActiveRecord::Schema.define(:version => 20101113132028) do

  create_table "garmin_ids", :force => true do |t|
    t.string   "GeoNamesCode"
    t.string   "GarminID"
    t.string   "GarminFeatureDescription"
    t.string   "KEY"
    t.string   "VALUE"
    t.string   "Code"
    t.string   "Feature"
    t.string   "Description"
    t.string   "Group"
    t.string   "GroupName"
    t.string   "Comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "google_sheets", :force => true do |t|
    t.string   "key"
    t.string   "sheettype"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "headerrow"
    t.string   "classname"
    t.string   "sheetname"
  end

  create_table "gtfs_agencies", :force => true do |t|
    t.string   "agency_phone"
    t.string   "agency_url"
    t.string   "agency_id"
    t.string   "agency_name"
    t.string   "agency_timezone"
    t.string   "agency_lang"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gtfs_source_id"
  end

  create_table "gtfs_calendar_dates", :force => true do |t|
    t.string   "service_id"
    t.string   "date"
    t.integer  "exception_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gtfs_source_id"
  end

  create_table "gtfs_calendars", :force => true do |t|
    t.integer  "gtfs_source_id"
    t.string   "service_id"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.string   "start_date"
    t.string   "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gtfs_fare_attributes", :force => true do |t|
    t.integer  "fare_id"
    t.float    "price"
    t.string   "currency_type"
    t.integer  "payment_method"
    t.integer  "transfers"
    t.float    "transfer_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gtfs_source_id"
  end

  create_table "gtfs_routes", :force => true do |t|
    t.integer  "gtfs_source_id"
    t.integer  "transiki_route_id"
    t.string   "route_id"
    t.integer  "agency_id"
    t.string   "route_short_name"
    t.string   "route_long_name"
    t.string   "route_desc"
    t.string   "route_type"
    t.string   "route_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "route_text_color"
    t.string   "route_color"
  end

  create_table "gtfs_shapes", :force => true do |t|
    t.integer  "shape_id"
    t.float    "shape_pt_lat"
    t.float    "shape_pt_lon"
    t.integer  "shape_pt_sequence"
    t.float    "shape_dist_traveled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gtfs_source_id"
  end

  create_table "gtfs_sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "version"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gtfs_stop_times", :force => true do |t|
    t.integer  "gtfs_source_id"
    t.string   "trip_id"
    t.string   "arrival_time"
    t.string   "departure_time"
    t.integer  "stop_id"
    t.integer  "stop_sequence"
    t.integer  "pickup_type"
    t.integer  "drop_off_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "shape_dist_traveled"
    t.string   "stop_headsign"
  end

  create_table "gtfs_stops", :force => true do |t|
    t.integer  "gtfs_source_id"
    t.string   "stop_id"
    t.string   "stop_name"
    t.string   "stop_description"
    t.decimal  "stop_lat"
    t.decimal  "stop_lon"
    t.string   "stop_street"
    t.string   "stop_city"
    t.string   "stop_region"
    t.string   "stop_postcode"
    t.string   "stop_country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_station"
    t.string   "location_type"
    t.string   "zone_id"
    t.string   "stop_url"
    t.string   "stop_code"
    t.string   "stop_desc"
  end

  create_table "gtfs_trips", :force => true do |t|
    t.integer  "gtfs_source_id"
    t.string   "route_id"
    t.string   "service_id"
    t.string   "trip_id"
    t.string   "trip_headsign"
    t.integer  "block_id"
    t.integer  "shape_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "direction_id"
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
