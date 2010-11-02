class AddVersionIdToRoutePoints < ActiveRecord::Migration
  def self.up
    add_column :route_points, :version, :integer
  end

  def self.down
    remove_column :route_points, :version
  end
end
