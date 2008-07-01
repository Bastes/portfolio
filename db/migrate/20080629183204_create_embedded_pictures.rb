class CreateEmbeddedPictures < ActiveRecord::Migration
  def self.up
    create_table :embedded_pictures do |t|
      t.integer :page_id
      t.integer :picture_id
      t.integer :rank

      t.timestamps
    end
  end

  def self.down
    drop_table :embedded_pictures
  end
end
