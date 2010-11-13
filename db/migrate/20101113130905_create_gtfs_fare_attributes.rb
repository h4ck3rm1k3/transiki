class CreateGtfsFareAttributes < ActiveRecord::Migration
  def self.up
    create_table :gtfs_fare_attributes do |t|
      t.integer :fare_id
      t.float :price
      t.string :currency_type
      t.integer :payment_method
      t.integer :transfers
      t.float :transfer_duration

      t.timestamps
    end
  end

  def self.down
    drop_table :gtfs_fare_attributes
  end
end
