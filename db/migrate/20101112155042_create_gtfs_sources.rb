class CreateGtfsSources < ActiveRecord::Migration
  def self.up
    create_table :gtfs_sources do |t|
      t.string :name
      t.string :url
      t.integer :version
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_sources
  end
end
