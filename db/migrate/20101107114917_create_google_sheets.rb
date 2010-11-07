class CreateGoogleSheets < ActiveRecord::Migration
  def self.up
    create_table :google_sheets do |t|
      t.string :key
      t.string :type
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :google_sheets
  end
end
