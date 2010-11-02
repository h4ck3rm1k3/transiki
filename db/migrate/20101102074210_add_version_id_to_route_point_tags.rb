class AddVersionIdToRoutePointTags < ActiveRecord::Migration
  def self.up
    add_column :route_point_tags, :version, :integer
  end

  def self.down
    remove_column :route_point_tags, :version
  end
end
