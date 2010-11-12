class CreateGtfsTrips < ActiveRecord::Migration
  def self.up
    create_table :gtfs_trips do |t|
      t.integer :gtfs_source_id
      t.string :route_id
      t.string :service_id
      t.string :trip_id
      t.string :trip_headsign
      t.integer :block_id
      t.integer :shape_id

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_trips
  end
end
