class ConceptSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :section_id, :favorited
  belongs_to :user, serializer: ConceptUserSerializer
  belongs_to :section
end