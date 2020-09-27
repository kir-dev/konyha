class CreateAppliances < ActiveRecord::Migration[6.0]
  def change
    create_table :appliances do |t|
      t.string :name
      t.integer :category
      t.integer :status
      t.text :description
      t.references :kitchen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
