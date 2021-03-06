class WorkSerializer < ActiveModel::Serializer
  attributes :id, :title, :min_year, :max_year, :longitude, :latitude, :circa, :place, :created_at, :updated_at

  # has_one   :collection, embed: :id, include: false
  # has_many  :creators, embed: :id, include: true
  # has_many  :references, embed: :id, include: true
  # has_many  :modes, embed: :id, include: true
  # has_many  :resources, embed: :ids, include: true, key: :resources
  # has_many  :media, embed: :ids, include: true, key: :media
end
