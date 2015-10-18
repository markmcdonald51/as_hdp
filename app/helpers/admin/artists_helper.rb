module Admin::ArtistsHelper



  def artist_front_page_image_column(record, column)
    asset_column(record.front_page_image, column) unless record.front_page_image.blank?
  end



end
