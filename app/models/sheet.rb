class Sheet < ActiveRecord::Base
  has_many :notebook_sheets, dependent: :destroy
  has_many :notebooks, through: :notebook_sheets
  has_many :sheet_tags, dependent: :destroy
  has_many :tags, through: :sheet_tags
  has_many :todos

  validates_presence_of :title
end
