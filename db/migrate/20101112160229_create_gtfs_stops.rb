class CreateGtfsStops < ActiveRecord::Migration
  def self.up
    create_table :gtfs_stops do |t|
      t.integer :gtfs_source_id
      t.string :stop_id
      t.string :stop_name
      t.string :stop_description
      t.decimal :stop_lat
      t.decimal :stop_lon
      t.string :stop_street
      t.string :stop_city
      t.string :stop_region
      t.string :stop_postcode
      t.string :stop_country

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_stops
  end
end
