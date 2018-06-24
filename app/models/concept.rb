class Concept < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :languages, through: :sections

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :comments, allow_destroy: true
end
