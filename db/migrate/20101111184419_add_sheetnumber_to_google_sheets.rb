class AddSheetnumberToGoogleSheets < ActiveRecord::Migration
  def self.up
    add_column :google_sheets, :sheetname, :string
  end

  def self.down
    remove_column :google_sheets, :sheetname
  end
end
