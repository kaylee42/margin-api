class TodoListSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title
  has_one :user, serializer: UserLiteSerializer
  has_many :todos
end
