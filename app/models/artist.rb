class Artist < ActiveRecord::Base
  acts_as_list

  belongs_to :artistable, polymorphic: true

  #delegate :site_section, to: :artistable, prefix: true
  #belongs_to :site_section
  belongs_to :layout
  #belongs_to :user

  has_many :categories, as: :categorical

  has_one :front_page_image, -> { where usage: 'front_page'},
    as: :attachable,  dependent: :destroy, class_name: 'Attachment'

  has_many :assets, -> { where usage:  'assets'},
    as: :attachable,  dependent: :destroy , class_name: 'Attachment'

  validates_uniqueness_of :name

  def to_param
   "#{id}-#{name.try(:parameterize)}"  if id
  end
end
