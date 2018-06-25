class Section < ApplicationRecord
  has_many :languages
  belongs_to :user, optional: true
  belongs_to :concept, optional: true

end
