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
  @stat_hash = prune_hash(params)
  redirect_to chart_path(@stat_hash)
  end

  def make_chart
    @stat_hash = prune_hash(params)
    

    @pie_chart_standin = Gchart.pie(
                            size: "500x500",
                            legend: @stat_hash.keys,
                            data: @stat_hash.values.collect(&:to_i),
                            bar_colors: make_random_colors(@stat_hash)
                             )

    @bar_chart_standin = Gchart.bar(
                            size: "500x500",
                            legend: @stat_hash.keys,
                            data: @stat_hash.values.collect(&:to_i), 
                            bar_colors: make_random_colors(@stat_hash).join("|")
                             )
    @new_chart = Stashed.new
    set_user_and_game_ids(@new_chart, get_user_from_stat_hash(@stat_hash), get_game_from_stat_hash(@stat_hash))
    @new_chart
  end

  def pick_chart
    chart_hash = params[:stashed]
    @user_chart = Stashed.generate_chart_from_data(chart_hash)
    raise
    redirect_to profile_path(session[:user_id])
  end



  private

  def prune_hash(hash)
    if hash.keys.include?('utf8')
     hash.delete "utf8"
     hash.delete "_method"
     hash.delete "authenticity_token"
     hash.delete "commit"
    end
     hash.delete "controller"
     hash.delete "action"
     hash
  end

  def make_random_colors(hash)
    @stat_hash.map do |color|
       "%06x" % (rand * 0xffffff)
    end
  end

  def get_game_from_stat_hash(hash)
    Stat.find_by_name(hash.keys.first).game
  end

  def get_user_from_stat_hash(hash)
    Stat.find_by_name(hash.keys.first).game.user
  end

  def set_user_and_game_ids(chart, user, game)
    chart.user_id = user.id
    chart.game_id = game.id
    chart.save
  end



end
