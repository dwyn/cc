class Section < ApplicationRecord
  has_many :languages
  belongs_to :concept#, optional: true

  accepts_nested_attributes_for :languages

  # def languages_attributes=(language_attributes)
  #   language_attributes.each do |i, attributes|
  #     self.languages.build(attributes)
  #   end
  # end

  
end
