class Concept < ApplicationRecord
  belongs_to :user
  belongs_to :section
  has_many :sections
  has_many :languages

  # validates :title, presence: true
  # validates :description, presence: true
    def screenshots_attributes=(screenshot_attributes)
    screenshot_attributes.each do |i, attributes|
      self.screenshots.build(attributes)
    end
  end

  def self.submitted_concepts
    self.all.collect{|concept| concept if concept}
  end

end
