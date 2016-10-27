class AddCollectorIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :collector_id, :integer
  end
end
