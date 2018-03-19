class Concept < ApplicationRecord
  belongs_to :user
  belongs_to :section
  has_many :sections
  has_many :languages

  # validates :title, presence: true
  # validates :description, presence: true
  
  def self.submitted_concepts
    self.all.collect{|concept| concept if concept.submitted}
  end

end
