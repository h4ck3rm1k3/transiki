class AddStopCodeToGtfsStops < ActiveRecord::Migration
  def self.up
    add_column :gtfs_stops, :stop_code, :string
  end

  def self.down
    remove_column :gtfs_stops, :stop_code
  end
end
