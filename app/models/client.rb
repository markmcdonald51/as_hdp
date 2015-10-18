class Client < ActiveRecord::Base

  belongs_to :clientele, polymorphic: true

  geocoded_by :address, latitude: :lat, longitude: :lng  do |obj,results|
    if geo = results.first
      obj.address = geo.formatted_address
      obj.lat = geo.latitude
      obj.lng = geo.longitude
    end
  end

  has_many :contacts, as: :contactable, class_name: 'Person' #, dependency: :destroy

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  #after_validation :titleize_name, if: ->(obj){ obj.name.present? and obj.name_changed? }

  validates_presence_of :name

  def to_param
   "#{id}-#{name.try(:parameterize)}"  if id
  end

end
