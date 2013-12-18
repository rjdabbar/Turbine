class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
