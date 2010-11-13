class CreateGtfsCalendars < ActiveRecord::Migration
  def self.up
    create_table :gtfs_calendars do |t|
      t.integer :gtfs_source_id
      t.string :service_id
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_calendars
  end
end