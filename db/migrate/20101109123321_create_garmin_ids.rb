class CreateGarminIds < ActiveRecord::Migration
  def self.up
    create_table :garmin_ids do |t|
      t.string :GeoNamesCode
      t.string :GarminID
      t.string :GarminFeatureDescription
      t.string :KEY
      t.string :VALUE
      t.string :Code
      t.string :Feature
      t.string :Description
      t.string :Group
      t.string :GroupName
      t.string :Comments

      t.timestamps
    end
  end

  def self.down
    drop_table :garmin_ids
  end
end
