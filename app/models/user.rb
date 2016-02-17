class User < ActiveRecord::Base
  has_many :notebook_users
  has_many :notebooks, through: :notebook_users
  has_many :todo_lists
  has_many :todos, through: :todo_lists

  validates_presence_of :name
end
