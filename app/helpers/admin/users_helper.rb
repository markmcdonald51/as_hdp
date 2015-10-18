module Admin::UsersHelper


  # creates a popup link to page link
 def user_image_url_column(record, column)
    image_tag record.image_url
  end


end
