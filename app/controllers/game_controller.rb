class GameController < ApplicationController



  def show
    user = User.find session[:user_id]
    @game = Game.find params[:id]
    @games_stats = @game.stats.empty? ? Stat.check_for_stats(user, @game) : @game.stats
    @game_achievements = @game.achievements.empty? ? Achievement.check_for_achievements(user, @game) : @game.achievements
   
  end

  def index
    

  end

  def stash
  #fills a hash with stats to put in a chart
  @stat_hash = params
  @stat_hash.delete "utf8"
  @stat_hash.delete "_method"
  @stat_hash.delete "authenticity_token"
  @stat_hash.delete "commit"
  @stat_hash.delete "controller"
  @stat_hash.delete "action"

  @stat_hash 
  redirect_to chart_path(@stat_hash)
  end

  def make_chart
    @stat_hash = params
    @stat_hash.delete "controller"
    @stat_hash.delete "action"
  end




end
