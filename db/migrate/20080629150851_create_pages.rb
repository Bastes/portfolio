class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :section_id
      t.integer :rank
      
      t.string :title
      t.string :subtitle
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
