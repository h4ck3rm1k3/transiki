class AddFieldsToGtfsTrips < ActiveRecord::Migration
  def self.up
    add_column :gtfs_trips, :direction_id, :integer
  end

  def self.down
    remove_column :gtfs_trips, :direction_id
  end
end
