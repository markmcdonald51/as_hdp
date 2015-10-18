class Admin::LocationsController < Admin::Auth
  active_scaffold :"location" do |config|
      #config.columns = [:name, :location] 
  end
end
