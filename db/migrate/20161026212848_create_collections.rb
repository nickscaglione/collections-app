class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :category
      t.integer :owner_id

      t.timestamps
    end
  end
end
