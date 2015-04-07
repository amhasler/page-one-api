class WorkSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :circa, :place, :created_at, :updated_at

  has_many  :creators, embed: :id, include: true
  has_many  :references, embed: :id, include: true
  has_many  :modes, embed: :id, include: true
  has_many :resources, embed: :ids, include: true, key: :resources
  has_many :media, embed: :ids, include: true, key: :media
end
