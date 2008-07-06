class Picture < ActiveRecord::Base
  # link to pages
  has_many :embedded_pictures, :dependent => :destroy
  has_many :pages, :through => :embedded_pictures
  
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
  
  # access to the image's dimensions
  def dimensions( type = :original )
    command = <<-end_command
      #{ Paperclip.path_for_command('identify') }
      -format "{:width => %[fx:w], :height => %[fx:h]}"
      "#{ attachment.path type }"
    end_command
    eval(%x[#{command.gsub(/\s+/, " ")}])
  end
  
  # thumbnail recropping
  def recrop_thumb(left, top, version = :original, factor = 1)
    dims = self.dimensions(:thumb)
    command = <<-end_command
      #{ Paperclip.path_for_command('convert') }
      "#{ File.expand_path(self.attachment.path(version)) }"
      -crop #{dims[:width] * factor}x#{dims[:height] * factor}+#{left}+#{top} +repage
      -resize #{dims[:width]}x#{dims[:height]}
      "#{ File.expand_path(self.attachment.path(:thumb)) }"
    end_command
    success = system(command.gsub(/\s+/, " "))
    
    if success && $?.exitstatus != 0 && @whiny_thumbnails
      raise PaperclipError, "There was an error processing this thumbnail"
    end
    
    success
  end
end
