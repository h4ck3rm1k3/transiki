class AddRouteIdToRoutePoints < ActiveRecord::Migration
  def self.up
    add_column :route_points, :route_id, :integer
  end

  def self.down
    remove_column :route_points, :route_id
  end
end
