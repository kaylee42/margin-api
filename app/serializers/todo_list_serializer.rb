class TodoListSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title
  has_one :user
  has_many :todos
end
