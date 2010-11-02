class DropOldStuff < ActiveRecord::Migration
  def self.up
    drop_table :old_points
    drop_table :old_point_tags
    drop_table :old_routes
    drop_table :old_route_tags
    drop_table :old_route_points

  end

  def self.down
  end
end
