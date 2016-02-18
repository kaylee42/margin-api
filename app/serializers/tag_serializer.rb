class TagSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title
  has_many :sheets, serializer: SheetLiteSerializer
end
