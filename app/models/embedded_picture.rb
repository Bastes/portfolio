class EmbeddedPicture < ActiveRecord::Base
  belongs_to :page
  belongs_to :picture
end
