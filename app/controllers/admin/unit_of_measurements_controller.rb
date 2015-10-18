class Admin::UnitOfMeasurementsController <  Admin::Auth
  active_scaffold :"unit_of_measurement" do |config|
    config.create.multipart = 'local'
    config.update.multipart = 'local'
    config.columns[:items].form_ui = :chosen
    config.columns = [:name, :image, :items]
    #config.columns.exclude(:parent, :created_at, :updated_at)
  end
end
