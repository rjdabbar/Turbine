class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.string :name
      t.integer :achieved

      t.timestamps
    end
  end
end
