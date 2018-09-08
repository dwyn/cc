class ConceptSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :section_id, :favorited
end