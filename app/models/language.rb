class Language < ApplicationRecord
  belongs_to :section
  has_many :sections
  
end
