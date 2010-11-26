class AddMediawikicategoryToMediawikiimagefiles < ActiveRecord::Migration
  def self.up
    add_column :mediawikiimagefiles, :mediawikicategory_id, :integer
  end

  def self.down
    remove_column :mediawikiimagefiles, :mediawikicategory_id
  end
end
