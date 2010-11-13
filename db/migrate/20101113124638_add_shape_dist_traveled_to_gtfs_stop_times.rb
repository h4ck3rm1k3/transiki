class AddShapeDistTraveledToGtfsStopTimes < ActiveRecord::Migration
  def self.up
    add_column :gtfs_stop_times, :shape_dist_traveled, :float
  end

  def self.down
    remove_column :gtfs_stop_times, :shape_dist_traveled
  end
end
