class AddPointIdToRoutePoints < ActiveRecord::Migration
  def self.up
    add_column :route_points, :point_id, :integer
  end

  def self.down
    remove_column :route_points, :point_id
  end
end
