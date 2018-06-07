class Section < ApplicationRecord
  has_many :languages
  belongs_to :concept, optional: true

  accepts_nested_attributes_for :languages
end
