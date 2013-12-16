# class Game < ActiveRecord::Base
#   belongs_to :user

#   def self.get_game_list_for(user)
#     url = URI.parse(URI.encode("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{"user.uid"}&format=json&include_appinfo=1"))
#     res = Net::HTTP::get(url)
#     parse = JSON.parse(res)
#     game_list_array = parse["response"].last

#     game_list_array.each do |game_hash|
#       create! do |game|
#         game.game_id = game_hash["appid"]
#         game.name = game_hash["name"]
#         game.logo_url = game_hash["img_logo_url"]
#         game.icon_url = game_hash["img_icon_url"]
#         game.playtime_lifetime = game_hash["playtime_forever"]
#         if game_hash.include?(["playtime_2weeks"])
#           game.playtime_2weeks = game_hash["playtime_2weeks"]
#         end
#       end
#     end
#   end
# end
