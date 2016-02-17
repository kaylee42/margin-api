class CreateNotebookUsers < ActiveRecord::Migration
  def change
    create_table :notebook_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notebook, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
