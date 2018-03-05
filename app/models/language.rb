class Language < ApplicationRecord
  belongs_to :sections
  has_many :sections
  
end
