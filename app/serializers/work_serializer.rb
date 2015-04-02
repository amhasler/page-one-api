class WorkSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :circa, :place, :created_at, :updated_at
end
