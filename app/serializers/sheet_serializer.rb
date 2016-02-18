class SheetSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :content
  has_many :tags, serializer: TagLiteSerializer
  has_many :todos, :notebooks, serializer: NotebookLiteSerializer
end
