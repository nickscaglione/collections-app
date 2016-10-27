class CreateCollectors < ActiveRecord::Migration[5.0]
  def change
    create_table :collectors do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
