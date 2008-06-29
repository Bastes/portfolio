module PagesHelper
  def link_to_page(page)
    link_to(page.title, page, :title => page.title)
  end
end
