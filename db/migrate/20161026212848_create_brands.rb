class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :category
      t.integer :owner_id
      t.string :api_name

      t.timestamps
    end
  end
end
