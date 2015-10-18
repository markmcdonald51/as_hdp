class ItemMeasurement < ActiveRecord::Base
  belongs_to :item
  belongs_to :unit_of_measurement

  
end
