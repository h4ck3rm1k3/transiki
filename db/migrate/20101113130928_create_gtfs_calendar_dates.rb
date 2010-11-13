class CreateGtfsCalendarDates < ActiveRecord::Migration
  def self.up
    create_table :gtfs_calendar_dates do |t|
      t.string :service_id
      t.string :date
      t.integer :exception_type

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_calendar_dates
  end
end
