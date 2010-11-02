class AddValuesToRouteTags < ActiveRecord::Migration
  def self.up
    add_column :route_tags, :key, :string
    add_column :route_tags, :value, :string
    add_column :route_tags, :route_id, :integer
    add_column :route_tags, :version, :integer
  end

  def self.down
    remove_column :route_tags, :version
    remove_column :route_tags, :route_id
    remove_column :route_tags, :value
    remove_column :route_tags, :key
  end
end
