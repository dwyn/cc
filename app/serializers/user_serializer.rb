class UserSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :admin, :name
end