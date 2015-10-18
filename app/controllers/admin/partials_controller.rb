class Admin::PartialsController < Admin::Auth
  active_scaffold :"partial" do |config|
  end
end
