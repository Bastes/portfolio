class EmbeddedDocument < ActiveRecord::Base
  belongs_to :page
  belongs_to :document
end
