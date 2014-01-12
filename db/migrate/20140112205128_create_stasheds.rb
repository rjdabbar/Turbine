class CreateStasheds < ActiveRecord::Migration
  def change
    create_table :stasheds do |t|
      t.string :chart_data
      t.string :title, default: ""
      t.string :data_color, default: "aaaaaa"
      t.string :background_color, default: "aaaaaa"
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
