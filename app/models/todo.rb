class Todo < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :sheet

  validates_presence_of :title, :aasm_state, :todo_list_id
end
