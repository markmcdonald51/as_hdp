module Admin::AttachmentsHelper

  def asset_column(record, column)
     image_tag record.asset.url(:thumb).html_safe
  end


end
