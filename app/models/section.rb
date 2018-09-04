class Section < ApplicationRecord
  has_many :languages
  has_many :concepts
  has_many :users, through: :concepts#, optional: true
end
