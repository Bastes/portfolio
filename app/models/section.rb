class Section < ActiveRecord::Base
  # link to the section's pages
  has_many :pages, :order => 'pages.rank ASC', :dependent => :destroy
  
  # validations
  validates_presence_of :title
  validates_uniqueness_of :title
  
  # scopes
  named_scope :ordered, :order => 'rank ASC'
end
