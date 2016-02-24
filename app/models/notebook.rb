class Notebook < ActiveRecord::Base
  has_many :notebook_users, dependent: :destroy
  has_many :users, through: :notebook_users
  has_many :notebook_sheets, dependent: :destroy
  has_many :sheets, through: :notebook_sheets
  has_many :tags, through: :sheets


  validates_presence_of :title
end
