class SiteSection < ActiveRecord::Base
  acts_as_list
  has_ancestry
  #belongs_to :layout
  #belongs_to :collection_template
  #has_many :artists, as: :artistable, dependent: :destroy

  #has_one :document, as: :documentable
  #has_many :assets, through: :document, class_name: 'Attachment'
  #has_one :image,  as: :attachable,  dependent: :destroy, class_name: 'Attachment'

  has_many :items, as: :itemable

  has_one :image, as: :attachable,  dependent: :destroy, class_name: 'Attachment'

  #has_many :assets, -> { where usage:  'assets'},
#    as: :attachable,  dependent: :destroy , class_name: 'Attachment'



  def to_param
   "#{id}-#{try(:name).try(:parameterize)}"  if id
  end
end
