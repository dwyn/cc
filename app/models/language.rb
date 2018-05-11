class Language < ApplicationRecord
  belongs_to :section#, optional: true
end
