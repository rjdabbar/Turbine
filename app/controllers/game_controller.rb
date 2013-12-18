class GameController < ApplicationController



  def show
    user = User.find session[:user_id]
    @game = Game.find params[:id]
     @games_stats = @game.stats.empty? ? Stat.check_for_stats(user, @game) : @game.stats
    @game_achievements = @game.achievements.empty? ? Achievement.check_for_achievements(user, @game) : @game.achievements

  end

  def index
    
  end


end
