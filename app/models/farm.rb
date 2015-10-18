class Farm < ActiveRecord::Base
  belongs_to :user
  has_many :clients, as: :clientele

  #has_many :farm_crops
  #has_many :fields

end
