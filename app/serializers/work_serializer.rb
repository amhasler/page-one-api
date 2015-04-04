class WorkSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :circa, :place, :created_at, :updated_at

  has_many  :creators
  has_many  :references
  has_many  :modes
  has_one   :collection, embed: :id, key: :collection
  has_many :resources, embed: :ids, include: true, key: :resources
  has_many :media, embed: :ids, include: true, key: :media
end
