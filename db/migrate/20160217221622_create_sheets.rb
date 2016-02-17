class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
