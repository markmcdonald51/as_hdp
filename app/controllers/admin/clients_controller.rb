class Admin::ClientsController <  Admin::Auth
  active_scaffold :"client" do |config|
    config.columns = [:name, :address, :phone, :contacts]
  end
end
