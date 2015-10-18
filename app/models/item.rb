class Item < ActiveRecord::Base
  acts_as_list
  belongs_to :itemable, polymorphic: true
  #has_many :attachments, as: :attachable,  dependent: :destroy
  has_one :document,     as: :documentable
  has_one :partial,      as: :partialable

  has_one :item_measurement
  has_one :unit_of_measurement, through: :item_measurement

  has_one :image, -> { where usage:  'front_page'},
    as: :attachable,  dependent: :destroy, class_name: 'Attachment'

  has_many :sellable_locations, as: :locatable, class_name: 'Location'

  has_many :attachments, -> { where usage:  'assets'},
    as: :attachable,  dependent: :destroy , class_name: 'Attachment'

  geocoded_by :location, :latitude  => :lat, :longitude => :lng do |obj,results|
    if geo = results.first
      obj.location = geo.formatted_address
    end
  end

  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }




  def to_param
   "#{id}-#{title.try(:parameterize)}"  if id
  end

end
