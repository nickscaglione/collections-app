class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :count
      t.integer :brand_id
      t.string :image_url
      
      t.timestamps 
    end
  end
end
