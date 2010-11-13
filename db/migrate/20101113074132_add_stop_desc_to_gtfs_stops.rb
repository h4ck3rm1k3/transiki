class AddStopDescToGtfsStops < ActiveRecord::Migration
  def self.up
    add_column :gtfs_stops, :stop_desc, :string
  end

  def self.down
    remove_column :gtfs_stops, :stop_desc
  end
end
