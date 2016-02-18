class NotebookSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :description
  has_many :sheets, :users, :tags
end
