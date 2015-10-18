class Document < ActiveRecord::Base
  belongs_to :documentable, polymorphic: true

  has_one :front_page_image, -> { where usage: 'front_page'},
    as: :attachable,  dependent: :destroy, class_name: 'Attachment'

  has_many :assets, -> { where usage:  'assets'},
    as: :attachable,  dependent: :destroy , class_name: 'Attachment'

end
