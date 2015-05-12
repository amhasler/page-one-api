class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :link, :title, :description

  has_one   :work, embed: :id, key: :work
end
