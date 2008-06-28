class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
