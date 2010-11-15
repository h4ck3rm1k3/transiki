class CreateMediawikicategories < ActiveRecord::Migration
  def self.up
    create_table :mediawikicategories do |t|
      t.integer :mediawikiserver_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :mediawikicategories
  end
end
