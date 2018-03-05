class Concept < ApplicationRecord
  belongs_to :user
  belongs_to :sections
  has_many :sections
  has_mamy :languages

  validates :title, presence: true
  validates :description, presence: true

end
