class Picture < ActiveRecord::Base
  # paperclip attachment
  has_attached_file :attachment,
                    :styles => { :thumb  => THUMB_FORMAT,
                                 :scaled => SCALED_FORMAT }
  
  # validation
  validates_attachment_presence :attachment
  validates_attachment_content_type :attachment,
                                    [ 'image/png',
                                      'image/jpg',
                                      'image/jpeg',
                                      'image/gif' ]
  validates_attachment_thumbnails :attachment
  
end
