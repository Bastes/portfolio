module DocumentsHelper
  def link_to_document(document)
    presentation =
      "#{document.attachment_file_name} - " +
      "#{'%.2f' % (document.attachment_file_size.to_f / 1.megabytes)} Mo"
    link_to presentation,
            document.attachment.url,
            :target => '_blank',
            :title => presentation
  end
end
