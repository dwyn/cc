class Section < ApplicationRecord
  has_many :languages
  belongs to :user
  belongs_to :concept, optional: true

  accepts_nested_attributes_for :languages
end
