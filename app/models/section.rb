class Section < ApplicationRecord
  has_many :languages
  belongs_to :concept
end
