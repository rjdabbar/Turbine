class Friend < ActiveRecord::Base
  belongs_to :user

  def self.create_friend_list_for(user)
    url = URI.parse("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{user.uid}&relationship=friend")
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    friend_array = parse["friendslist"]["friends"]

    friend_array.each do |friend|
      friend_id = friend["steamid"]
      Friend.create_friend_with(friend_id, user.id)
    end
end
  
  def self.create_friend_with(friend_id, user_id)
     url = URI.parse(URI.encode("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_WEB_API_KEY']}&steamids=#{friend_id}"))
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    hash = parse["response"]["players"].first

    create! do |friend|
      friend.name = hash["personaname"]
      friend.steam_id = hash["steamid"]
      friend.avatar = hash["avatar"]
      friend.persona_state = hash["personastate"]
      friend.profile_url = hash["profileurl"]
      friend.user_id = user_id
    end

end

def self.get_friend_list_for(user)
  all_friends = Friend.all
  friends =[]
  all_friends.each do |f|
    if f.user_id = user.id
      friends << f
    end
  end

end




end
