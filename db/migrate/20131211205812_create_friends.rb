class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :avatar
      t.string :persona_state
      t.string :profile_url

      t.timestamps
    end
  end
end
