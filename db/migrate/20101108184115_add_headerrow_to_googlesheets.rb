class AddHeaderrowToGooglesheets < ActiveRecord::Migration
  def self.up
    add_column :google_sheets, :headerrow, :integer
    add_column :google_sheets, :classname, :string
  end

  def self.down
    remove_column :google_sheets, :classname
    remove_column :google_sheets, :headerrow
  end
end
