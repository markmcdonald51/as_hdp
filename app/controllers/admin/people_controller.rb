class Admin::PeopleController < Admin::Auth
  active_scaffold :"person" do |config|
    config.columns = [:name, :title, :description, :address, :email, :phone, :mobile_phone, :skype]
  end
end
