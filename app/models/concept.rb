class Concept < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :languages, through: :sections

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :sections

  def self.which_section
    self.all.where("section_id")
  end
end
