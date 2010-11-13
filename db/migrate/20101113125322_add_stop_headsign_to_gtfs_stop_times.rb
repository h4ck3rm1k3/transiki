class AddStopHeadsignToGtfsStopTimes < ActiveRecord::Migration
  def self.up
    add_column :gtfs_stop_times, :stop_headsign, :string
  end

  def self.down
    remove_column :gtfs_stop_times, :stop_headsign
  end
end
