module PagesHelper
  def link_to_page(page)
    thumb_url = page.thumb_url
    link_to(
      thumb_url.nil? ?
        page.title :
        image_tag(thumb_url, :alt => page.title, :title => page.title),
      page, :title => page.title)
  end
end
