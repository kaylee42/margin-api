class SheetTag < ActiveRecord::Base
  belongs_to :sheet
  belongs_to :tag
end
