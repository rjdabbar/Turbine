class Stat < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def  self.set_stats_for(user, game)
    url = URI.parse("http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=#{game.game_id}&key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{user.uid}")
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    stats_array = parse["playerstats"]["stats"]
    
    stats_array.each do |stat|
      create! do |statistic|      
        statistic.user_id = user.id
        statistic.game_id = game.id
        statistic.name = stat["name"]
        statistic.value = stat["value"]
      end
    end
  end

  def self.check_for_has_stats(game)
    
  end


end
