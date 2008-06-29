module PicturesHelper
  def link_to_picture(picture, small_style = :scaled)
    presentation =
      "#{picture.attachment_file_name} - " +
      "#{'%.2f' % (picture.attachment_file_size.to_f / 1.megabytes)} Mo"
    link_to image_tag(picture.attachment.url(small_style), :alt => presentation),
            picture.attachment.url,
            :target => '_blank',
            :title => presentation
  end
end
