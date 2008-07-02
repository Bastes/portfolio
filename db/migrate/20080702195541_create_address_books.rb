class CreateAddressBooks < ActiveRecord::Migration
  def self.up
    create_table :address_books do |t|
      t.string :label
      t.text :description
      t.integer :rank

      t.timestamps
    end
  end

  def self.down
    drop_table :address_books
  end
end
