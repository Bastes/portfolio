class CreateEmbeddedDocuments < ActiveRecord::Migration
  def self.up
    create_table :embedded_documents do |t|
      t.integer :page_id
      t.integer :document_id
      t.integer :rank

      t.timestamps
    end
  end

  def self.down
    drop_table :embedded_documents
  end
end
