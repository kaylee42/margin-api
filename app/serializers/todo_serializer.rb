class TodoSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :description, :aasm_state, :due_date
  has_one :todo_list, :sheet, serializer: SheetLiteSerializer
end
