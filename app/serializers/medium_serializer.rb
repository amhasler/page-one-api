class MediumSerializer < ActiveModel::Serializer
  attributes :id, :caption, :content_type

  has_one   :work, embed: :id, key: :work
end
