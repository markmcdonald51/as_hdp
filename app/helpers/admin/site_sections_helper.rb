module Admin::SiteSectionsHelper

  def site_section_image_column(record, column)
    asset_column(record.image, column) unless record.image.blank?
  end
end
