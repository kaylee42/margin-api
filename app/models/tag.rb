class Tag < ActiveRecord::Base
  has_many :sheet_tags
  has_many :sheets, through: :sheet_tags

  validates_presence_of :title
end
