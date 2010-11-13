class CreateGtfsAgencies < ActiveRecord::Migration
  def self.up
    create_table :gtfs_agencies do |t|
      t.string :agency_phone
      t.string :agency_url
      t.string :agency_id
      t.string :agency_name
      t.string :agency_timezone
      t.string :agency_lang

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_agencies
  end
end
