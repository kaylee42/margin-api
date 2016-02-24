class AddNotebookidToSheets < ActiveRecord::Migration
  def change
    add_column :sheets, :notebookid, :integer
  end
end
