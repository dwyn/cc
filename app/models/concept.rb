class Concept < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :languages, through: :sections

  validates :title, presence: true
  validates :description, presence: true
end
