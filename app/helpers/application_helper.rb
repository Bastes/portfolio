# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Sets the menu item to highlight in this property
  attr_accessor :highlight
  
  # Defines the page title cleanly
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  # Defines complementary stylesheet calls cleanly
  def stylesheets(&block)
    content_for(:stylesheets, nil, &block)
  end
  
  # Executes the block's content if and only if the user is admin
   def admin_area(&block)
    if admin?
      yield
    end
  end
end
