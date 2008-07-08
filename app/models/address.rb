class Address < ActiveRecord::Base
  # link to adresses books
  belongs_to :address_book
  
  # attached banner (optional, relies on paperclip)
  has_attached_file :banner,
      :styles => { :original => BANNER_GEOMETRY },
      :url => '/images/banners/:id_:basename.:extension',
      :path => ':rails_root/public/images/banners/:id_:basename.:extension'

  
  # validations
  validates_presence_of :url, :message => 'ne peut pas Ãªtre vide'
  validates_presence_of :address_book
  validates_associated :address_book
  # paperclip validation
  validates_attachment_content_type :banner,
      :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
  # returns the image's label to display, wether that is the title, or the url
  def label
    title.blank? ? url : title
  end
end

