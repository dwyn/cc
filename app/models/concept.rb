class Concept < ApplicationRecord
  belongs_to :user
  belongs_to :sections
  # has_many :sections
  has_many :languages, through: :sections

  validates :title, presence: true
  validates :description, presence: true

  scope :favorited, -> { where(favorited: true) }
end
