class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
