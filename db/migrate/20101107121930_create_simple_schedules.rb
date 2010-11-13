class CreateSimpleSchedules < ActiveRecord::Migration
  def self.up
    create_table :simple_schedules do |t|
      t.string :fromloc
      t.string :toloc
      t.string :transporttype
      t.string :departuretimes
      t.string :dayofweek
      t.float :cost
      t.string :currency
      t.string :estimatedtraveltime
      t.string :departinglocation
      t.string :arrivinglocation

      t.timestamps
    end
  end

  def self.down
    drop_table :simple_schedules
  end
end
