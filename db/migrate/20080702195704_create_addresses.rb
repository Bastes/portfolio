class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :address_book_id
      t.string :url
      t.string :title
      t.integer :rank

      t.string :banner_file_name
      t.string :banner_content_type
      t.integer :banner_file_size
    
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
