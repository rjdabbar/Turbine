class StatsController < ApplicationController
  def index
    user = User.find(session[:user_id]) 
    @game_list = Game.get_games_with_stats_for(user)
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
