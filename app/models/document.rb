class Document < ActiveRecord::Base
  # link to pages
  has_many :embedded_documents, :dependent => :destroy
  has_many :pages, :through => :embedded_documents
  
  # paperclip attachment
  has_attached_file :attachment,
                    :url => '/attachments/:id_:basename.:extension',
                    :path => ':rails_root/public/attachments/:id_:basename.:extension'
  
  # validation
  validates_attachment_presence :attachment
  
end
