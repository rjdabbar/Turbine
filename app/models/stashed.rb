class Stashed < ActiveRecord::Base
  belongs_to :user
  belongs_to :game



  def self.prepare(chart, game, user)
    create do |stash|
      stash.chart_data = chart
      stash.user_id = user.id
      stash.game_id = game.id
    end
  end

end
