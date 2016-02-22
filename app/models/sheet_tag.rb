class SheetTag < ActiveRecord::Base
  belongs_to :sheet
  belongs_to :tag

  validates_presence_of :sheet_id, :tag_id
  validates :tag_id, uniqueness: {scope: :sheet_id}
end
