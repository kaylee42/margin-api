class Sheet < ActiveRecord::Base
  has_many :notebook_sheets
  has_many :notebooks, through: :notebook_sheets
  has_many :sheet_tags
  has_many :tags, through: :sheet_tags
  has_many :todos

  validates_presence_of :title
end
