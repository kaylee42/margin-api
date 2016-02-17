class NotebookSheet < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :sheet

  validates_presence_of :notebook_id, :sheet_id
  validates :sheet_id, uniqueness: {scope: :notebook_id}
  validates_associated :notebook, :sheet
end
