class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :user, index: true
      t.string :game_id
      t.string :name
      t.string :logo_url
      t.string :icon_url
      t.string :playtime_life
      t.string :playtime_2weeks

      t.timestamps
    end
  end
end
