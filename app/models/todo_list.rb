class TodoList < ActiveRecord::Base
  has_many :todos
  belongs_to :user

  validates_presence_of :title, :user_id
end
