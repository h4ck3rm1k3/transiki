class CreateMediawikiservers < ActiveRecord::Migration
  def self.up
    create_table :mediawikiservers do |t|
      t.string :name
      t.string :baseurl

      t.timestamps
    end
  end

  def self.down
    drop_table :mediawikiservers
  end
end
