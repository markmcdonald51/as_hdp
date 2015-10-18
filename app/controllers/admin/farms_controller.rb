class Admin::FarmsController < Admin::Auth
  active_scaffold :"farm" do |config|
  end
end
