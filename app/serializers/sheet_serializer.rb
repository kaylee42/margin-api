class SheetSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :content
  has_many :tags, :todos, :notebooks, serializer: NotebookLiteSerializer
end
