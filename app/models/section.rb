class Section < ApplicationRecord
  has_many :languages
  belongs_to :concept#, optional: true

  def languages_attributes=(language_attributes)
    language_attributes.each do |i, attributes|
      self.languages.build(attributes)
    end
  end
end
