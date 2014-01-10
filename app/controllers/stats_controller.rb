class StatsController < ApplicationController
  def index
    user = User.find(session[:user_id]) 
    @game_list = Game.get_games_with_stats_for(user)
    @stat_array = Stat.get_stats_array_for_chart(@game_list.sort.first)

    # @new_chart = Gchart.new
  end

  def show
  end
  
  def create
  end

  def edit
  end

  def new
  end

  def show
  end
end
