class Concept < ApplicationRecord
  belongs_to :user
  belongs_to :section, optional: true

  validates :title, presence: true
  validates :description, presence: true

end