class AddFieldsToGtfsRoutes < ActiveRecord::Migration
  def self.up
    add_column :gtfs_routes, :route_text_color, :string
    add_column :gtfs_routes, :route_color, :string
  end

  def self.down
    remove_column :gtfs_routes, :route_color
    remove_column :gtfs_routes, :route_text_color
  end
end
