class CreateTagTags < ActiveRecord::Migration
  def self.up
    create_table :tag_tags do |t|
      t.integer :tag_id
      t.string :key
      t.string :value
      t.integer :version
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_tags
  end
end
