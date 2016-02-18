class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name
  has_many :todo_lists, :todos, :notebooks, serializer: NotebookLiteSerializer
end
