class NotebookSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :description
  has_many :sheets
  has_many :users, serializer: UserLiteSerializer
  has_many :tags, serializer: TagLiteSerializer
end
