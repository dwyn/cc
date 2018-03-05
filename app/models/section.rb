class Section < ApplicationRecord
  has_many :concepts
  has_many :languages
  has_many :users, through: :concepts

  validates :title, presence: true
  validates :description, presence: true
end
