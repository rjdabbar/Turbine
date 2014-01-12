class CreateUserCharts < ActiveRecord::Migration
  def change
    create_table :user_charts do |t|
      t.belongs_to :user, index: true
      t.string :link

      t.timestamps
    end
  end
end
