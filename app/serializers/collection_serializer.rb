class CollectionSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :title

  has_many :works, embed: :objects, include: true, key: :works

end
