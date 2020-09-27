class CreateApplianceComments < ActiveRecord::Migration[6.0]
  def change
    create_table :appliance_comments do |t|
      t.integer :category
      t.text :body
      t.references :appliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
