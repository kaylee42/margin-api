class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notebook_users
  has_many :notebooks, through: :notebook_users
  has_many :todo_lists
  has_many :todos, through: :todo_lists

  validates_presence_of :name
end
