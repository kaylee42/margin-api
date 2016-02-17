class CreateNotebookSheets < ActiveRecord::Migration
  def change
    create_table :notebook_sheets do |t|
      t.references :notebook, index: true, foreign_key: true
      t.references :sheet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
