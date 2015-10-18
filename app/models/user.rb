class User < ActiveRecord::Base
  include AASM

  #has_many :timelines
  #has_many :project_collaborations, -> (user){ where fb_uid: user.uid} , class_name: 'Collaborator'

  ROLES = ['admin', 'privileged', 'basic']

  #has_one :artist
  has_many :artists, as: :artistable, dependent: :destroy
  has_one :contact, as: :contactable, class_name: 'Person', dependent: :destroy

  geocoded_by :postal_code, latitude: :lat, longitude: :lng  do |obj,results|
    if geo = results.first
      obj.lat = geo.latitude
      obj.lng = geo.longitude
      obj.postal_code = geo.address
    end
  end
  after_validation :geocode, if: ->(obj){ obj.postal_code.present? and obj.postal_code_changed? }

  # validations
  validates :provider, :uid, :name, :oauth_token, :image_url, presence: true

  # this validations are checked when updating user because can be nil when we authenticate through twitter
  validates :email, uniqueness: true, presence: true,
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i }, :on => :update
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :gender, presence: true, on: :update

  aasm do
      state :brand_new, :initial => true
      state :updated_profile
      state :trusted
      state :banned
      state :removed

      event :profile_updated do
        transitions :from => [:brand_new,:updated_profile], :to => :updated_profile
      end

      event :trust do
        transitions :from => [:updated_profile, :banned, :removed], :to => :trusted
      end

      event :banned do
        transitions :from => [:running, :cleaning], :to => :sleeping
      end
  end

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"] # nil when provider = twitter
      user.first_name = auth["info"]["first_name"] # nil when provider = twitter
      user.last_name = auth["info"]["last_name"] # nil when provider = twitter
      user.gender = auth["extra"]["raw_info"]["gender"] # nil when provider = twitter
      user.image_url = auth["info"]["image"]
      user.oauth_token = auth["credentials"]["token"]
    end
  end


  # in models/user.rb
  def is?(role)
    role.to_s == role.to_s
  end

  def is_admin?
    is?(:admin)
  end


  def to_param
   "#{id}-#{name.try(:parameterize)}"  if id
  end


 #@models = ActiveRecord::Base.connection.tables.collect{|t| t.underscore.singularize.camelize}
=begin
  # in models/user.rb
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end
=end
end
