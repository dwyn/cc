class UserSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :admin, :name
  has_many :concepts
end