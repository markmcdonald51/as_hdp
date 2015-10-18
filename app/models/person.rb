class Person < ActiveRecord::Base

  belongs_to :contactable, polymorphic: true
  validates_presence_of :name

  geocoded_by :address, :latitude  => :lat, :longitude => :lng  do |obj,results|
    if geo = results.first
      obj.address = geo.formatted_address
      obj.lat = geo.latitude
      obj.lng = geo.longitude
    end
  end

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :titleize_name, if: ->(obj){ obj.name.present? and obj.name_changed? }

  # validates :email, uniqueness: true, presence: true,
  #   format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i }, :on => :update

  #validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i }, :on => :update


  def titleize_name
    self.name = name.titleize
  end

  def to_param
   "#{id}-#{name.try(:parameterize)}"  if id
  end
end
