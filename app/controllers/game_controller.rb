class GameController < ApplicationController



  def show
    user = User.find session[:user_id]
    @game = Game.find params[:id]
    @games_stats = Stat.get_stats_for_game(@game).empty? ? Stat.set_stats_for(user, @game) : Stat.get_stats_for_game(@game)
  end

end
