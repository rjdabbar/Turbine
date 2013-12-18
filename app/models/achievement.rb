class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def self.check_for_achievements(user, game)
    url = URI.parse("http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/v0001/?appid=#{game.game_id}&key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{user.uid}")
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    if parse.has_key?("playerstats")
      if parse["playerstats"].has_key?("achievements")
        Achievement.set_achievements_with(parse, user, game)
      end
    end
  end

  def self.set_achievements_with(hash, user, game)
    cheese_array = hash["playerstats"]["achievements"]
    
    cheese_array.each do |cheese|
      create! do |achievement|      
        achievement.user_id = user.id
        achievement.game_id = game.id
        achievement.name = cheese["name"].nil? ? cheese["apiname"] : cheese["name"]
        achievement.achieved = cheese["achieved"]
      end
    end
  end

  def  self.set_achievements_for(user, game)
    url = URI.parse("http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/v0001/?appid=#{game.game_id}&key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{user.uid}")
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    cheese_array = parse["playerstats"]["achievements"]
    
    cheese_array.each do |cheese|
      create! do |achievement|      
        achievement.user_id = user.id
        achievement.game_id = game.id
        achievement.name = cheese["name"].nil? ? cheese["apiname"] : cheese["name"]
        achievement.achieved = cheese["achieved"]
      end
    end
  end

end
