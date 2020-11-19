class CreateKitchenAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :kitchen_assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :kitchen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
