class Partial < ActiveRecord::Base
  belongs_to :partialable, polymorphic: true
end
