class Document < ActiveRecord::Base
  # paperclip attachment
  has_attached_file :attachment
  
  # validation
  validates_attachment_presence :attachment
  
end
