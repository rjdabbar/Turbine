class Game < ActiveRecord::Base
  belongs_to :user
  has_many :stats

  def self.make_list_for(user)
    url = URI.parse(URI.encode("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{user.uid}&format=json&include_appinfo=1"))
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    game_list_array = parse["response"]["games"]

    game_list_array.each do |game_hash|
      if game_hash["name"].ends_with?("Test", "Beta", "Tool")
      else
        create! do |game|
          game.user_id = user.id
          game.game_id = game_hash["appid"]
          game.name = game_hash["name"]
          game.logo_url = "http://media.steampowered.com/steamcommunity/public/images/apps/#{game_hash["appid"]}/#{game_hash["img_logo_url"]}.jpg"
          game.icon_url = "http://media.steampowered.com/steamcommunity/public/images/apps/#{game_hash["appid"]}/#{game_hash["img_icon_url"]}.jpg"
          game.playtime_life = game_hash["playtime_forever"]
          if game_hash.include?(["playtime_2weeks"])
            game.playtime_2weeks = game_hash["playtime_2weeks"]
          end
          game.stats = Stat.set_stats_for(user, game)
        end
      end
    end
  end

  def self.get_game_list_for(user)
    all_games = Game.all.uniq!
    users_games =[]
    all_games.each do |game|
      if game.user_id = user.id
        users_games << game
      end
    end
    users_games.uniq {|g| g.name}
  end

end
