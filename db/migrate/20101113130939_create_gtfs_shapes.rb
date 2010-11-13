class CreateGtfsShapes < ActiveRecord::Migration
  def self.up
    create_table :gtfs_shapes do |t|
      t.integer :shape_id
      t.float :shape_pt_lat
      t.float :shape_pt_lon
      t.integer :shape_pt_sequence
      t.float :shape_dist_traveled

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_shapes
  end
end
