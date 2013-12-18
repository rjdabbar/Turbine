class GameController < ApplicationController



  def show
    user = User.find session[:user_id]
    @game = Game.find params[:id]
    @games_stats = @game.stats.empty? ? Stat.set_stats_for(user, @game) : @game.stats
    @game_achievements = @game.achievements.empty? ? Achievement.set_achievements_for(user, @game) : @game.achievements
  end

end
