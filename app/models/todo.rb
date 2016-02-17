class Todo < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :sheet
end
