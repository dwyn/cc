class Concept < ApplicationRecord
  belongs_to :user
  belongs_to :section

  validates :title, presence: true
  validates :description, presence: true

  scope :favorited, -> { where(favorited: true) }
end
