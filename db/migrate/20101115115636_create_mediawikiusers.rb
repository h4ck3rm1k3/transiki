class CreateMediawikiusers < ActiveRecord::Migration
  def self.up
    create_table :mediawikiusers do |t|
      t.integer :mediawikiserver_id
      t.string :name
      t.integer :user_id
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :mediawikiusers
  end
end
