class Section < ApplicationRecord
  has_many :languages
  belongs_to :concept, optional: true

  # validates :title, presence: true
  # validates :description, presence: true
end
