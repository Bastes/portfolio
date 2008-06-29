class Picture < ActiveRecord::Base
  # paperclip attachment
  has_attached_file :attachment,
                    :styles => { :thumb  => THUMB_FORMAT,
                                 :scaled => SCALED_FORMAT },
                    :url => '/images/pictures/:id_:basename_:style.:extension',
                    :path => ':rails_root/public/images/pictures/:id_:basename_:style.:extension'
  
  # validation
  validates_attachment_presence :attachment
  validates_attachment_content_type :attachment,
                                    :content_type => [ 'image/png',
                                                       'image/jpg',
                                                       'image/jpeg',
                                                       'image/gif' ]
  validates_attachment_thumbnails :attachment
  
end
