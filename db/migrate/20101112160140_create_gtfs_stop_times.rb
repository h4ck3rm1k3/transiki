class CreateGtfsStopTimes < ActiveRecord::Migration
  def self.up
    create_table :gtfs_stop_times do |t|
      t.integer :gtfs_source_id
      t.string :trip_id
      t.string :arrival_time
      t.string :departure_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.integer :pickup_type
      t.integer :drop_off_type

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_stop_times
  end
end
