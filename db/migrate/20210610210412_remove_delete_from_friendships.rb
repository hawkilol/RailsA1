class RemoveDeleteFromFriendships < ActiveRecord::Migration[6.1]
  def change
    remove_column :friendships, :delete, :string
  end
end
