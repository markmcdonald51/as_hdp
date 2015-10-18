module SectionsHelper
=begin
  # creates a popup link to page link
  def site_sections_image_column(record, column)
    image_tag record.image.asset.url(:thumbnail)
  end
=end
end
