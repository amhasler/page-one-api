class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  # has_many :collections, embed: :ids, include: true, key: :collections
end
