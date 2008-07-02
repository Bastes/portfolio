class AddressBook < ActiveRecord::Base
  # link to addresses
  has_many :addresses, :order => 'rank ASC', :dependent => :destroy
  
  # validations
  validates_presence_of :label, :message => 'ne peut pas Ãªtre vide'
  
end

