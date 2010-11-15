class CreateMediawikiimagefiles < ActiveRecord::Migration
  def self.up
    create_table :mediawikiimagefiles do |t|
      t.integer :mediawikiserver_id
      t.string :name
      t.text :description
      t.string :filetype
      t.string :imageurl
      t.string :imagethumb

      t.timestamps
    end
  end

  def self.down
    drop_table :mediawikiimagefiles
  end
end
