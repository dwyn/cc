class Section < ApplicationRecord
  has_many :languages
  belongs_to :concept, optional: true

  devise :database_authenticatable, :registerable, 
  :recoverable, :rememberable, :trackable, :validatable

  # validates :title, presence: true
  # validates :description, presence: true
end
