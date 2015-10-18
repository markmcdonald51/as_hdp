class Admin::ItemsController < Admin::Auth
  active_scaffold :"item" do |config|

    #config.columns[:itemable].form_ui = :chosen
    #config.columns[:itemable].options[:optgroup] = true

    config.columns = [:title, :summary, :location, :date_available, :date_unavailable,
      :unit_of_measurement, :units_available, :preorder, :unit_price, :sellable_locations,
       :image, :attachments]

    #config.list.columns = [:title, :location, :attachments, :price]

#
    config.columns[:unit_of_measurement].form_ui = :chosen
    config.columns[:location].label = 'Product Location'

    config.create.multipart = 'local'
    config.update.multipart = 'local'

  end
end
