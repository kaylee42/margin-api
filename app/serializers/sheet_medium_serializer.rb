class SheetMediumSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :content
  has_many :tags, serializer: TagLiteSerializer
  has_many :todos
end
