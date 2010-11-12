class CreateGtfsRoutes < ActiveRecord::Migration
  def self.up
    create_table :gtfs_routes do |t|
      t.integer :gtfs_source_id
      t.integer :transiki_route_id
      t.string :route_id
      t.integer :agency_id
      t.string :route_short_name
      t.string :route_long_name
      t.string :route_desc
      t.string :route_type
      t.string :route_url

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_routes
  end
end
