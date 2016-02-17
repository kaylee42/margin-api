class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :aasm_state
      t.datetime :due_date
      t.references :todo_list, index: true, foreign_key: true
      t.references :sheet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
