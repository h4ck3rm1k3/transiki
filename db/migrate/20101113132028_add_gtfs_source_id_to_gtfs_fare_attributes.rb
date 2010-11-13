class AddGtfsSourceIdToGtfsFareAttributes < ActiveRecord::Migration
  def self.up
    add_column :gtfs_fare_attributes,:gtfs_source_id, :integer
    add_column :gtfs_agencies,       :gtfs_source_id, :integer
    add_column :gtfs_calendar_dates, :gtfs_source_id, :integer
    add_column :gtfs_shapes,         :gtfs_source_id, :integer
  end

  def self.down
    remove_column :gtfs_fare_attributes, :gtfs_source_id
    remove_column :gtfs_agencies, :gtfs_source_id
    remove_column :gtfs_calendar_dates, :gtfs_source_id, :integer
    remove_column :gtfs_shapes, :gtfs_source_id, :integer

	

  end
end
