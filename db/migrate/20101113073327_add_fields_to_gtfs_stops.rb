class AddFieldsToGtfsStops < ActiveRecord::Migration
  def self.up
    add_column :gtfs_stops, :parent_station, :string
    add_column :gtfs_stops, :location_type, :string
    add_column :gtfs_stops, :zone_id, :string
    add_column :gtfs_stops, :stop_url, :string
  end

  def self.down
    remove_column :gtfs_stops, :stop_url
    remove_column :gtfs_stops, :zone_id
    remove_column :gtfs_stops, :location_type
    remove_column :gtfs_stops, :parent_station
  end
end
