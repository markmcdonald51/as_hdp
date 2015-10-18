class UnitOfMeasurement < ActiveRecord::Base

  has_one :image,  as: :attachable,  dependent: :destroy, class_name: 'Attachment'
  has_many :item_measurements
  has_many :items, through: :item_measurements


end
