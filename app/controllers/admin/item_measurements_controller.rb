class Admin::ItemMeasurementsController <  Admin::Auth
  active_scaffold :"item_measurement" do |config|
      #config.columns[:unit_of_measurement].form_ui = :chosen
  end
end
