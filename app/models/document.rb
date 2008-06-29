class Document < ActiveRecord::Base
  # paperclip attachment
  has_attached_file :attachment,
                    :url => '/attachments/:id_:basename.:extension',
                    :path => ':rails_root/public/attachments/:id_:basename.:extension'
  
  # validation
  validates_attachment_presence :attachment
  
end
