class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.integer :floor

      t.timestamps
    end
  end
end
