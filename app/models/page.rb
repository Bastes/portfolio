class Page < ActiveRecord::Base
  # scopes
  named_scope :newer, :limit => NEWER_PAGES_LIMIT, :order => 'created_at DESC'
  named_scope :ordered, :order => 'rank ASC'
  
  # links to embedded content
#  has_many :embedded_full_images, :include => :full_image, :order => 'rank ASC', :dependent => :destroy
#  has_many :embedded_documents, :include => :document, :order => 'rank ASC', :dependent => :destroy
  
  # link to section
  belongs_to :section
  
  # validations
  validates_presence_of :title
  validates_presence_of :section_id
  
  # page's thumbnail
#  def thumbnail
#    embedded_full_images.first ? embedded_full_images.first.full_image.thumbnail : nil
#  end
  
  # updates embedded full_images's ranks
#  def update_embedded_full_images_ranks(ranks)
#    update_embedded_ranks :full_images, ranks
#  end
  
  # updates embedded documents's ranks
#  def update_embedded_documents_ranks(ranks)
#    update_embedded_ranks :documents, ranks
#  end
  
  # updates embedded media's ranks
#  def update_embedded_ranks(type, ranks)
#    embeddeds = send('embedded_' + type.to_s)
#    ranks.each_index do |i|
#      embedded = embeddeds.find ranks[i]
#      embedded.rank = i
#      embedded.save
#    end
#  end
end
