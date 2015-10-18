class Category < ActiveRecord::Base
  acts_as_list
  has_ancestry

  has_many :items, as: :itemable, dependent: :destroy
  belongs_to :categorical, polymorphic: true
  has_one :attachment, as: :attachable,  dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, scope: [:categorical_id, :categorical_type]

  def to_param
   "#{id}-#{name.try(:parameterize)}"  if id
  end
end
