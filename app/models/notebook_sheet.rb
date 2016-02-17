class NotebookSheet < ActiveRecord::Base
  belongs_to :notebook
  belongs_to :sheet
end
