class AddSteamIdToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :steam_id, :string
  end
end
