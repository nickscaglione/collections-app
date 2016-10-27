class RemoveOwnerFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :owner_id
  end
end
