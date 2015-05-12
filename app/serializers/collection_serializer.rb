class CollectionSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :title

  has_many :works, embed: :ids, include: true, key: :works
  has_one  :user, embed: :id, key: :user
end
