class AddUserIdToAppliance < ActiveRecord::Migration[6.0]
  def change
    add_reference :appliances, :user, null: false, foreign_key: true
  end
end
