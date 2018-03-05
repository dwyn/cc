class Section < ApplicationRecord
  has_many :concepts
  has_many :languages
  has_many :uses, through: :concepts

  validates :title, presence: true
  validates :description, presence: true
end
