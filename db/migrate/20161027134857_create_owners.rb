class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
