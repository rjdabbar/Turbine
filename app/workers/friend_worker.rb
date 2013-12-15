class FriendWorker
  include Sidekiq::FriendWorker

  def perform(user)
    url = URI.parse("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['STEAM_WEB_API_KEY']}&steamid=#{user.uid}&relationship=friend")
    res = Net::HTTP::get(url)
    parse = JSON.parse(res)
    friend_array = parse["friendslist"]["friends"]

    friend_array.each do |friend|
      friend_id = friend["steamid"]
      url = URI.parse(URI.encode("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_WEB_API_KEY']}&steamids=#{friend_id}"))
      res = Net::HTTP::get(url)
      parse = JSON.parse(res)
      hash = parse["response"]["players"].first
      Friend.create_friend(hash)
    end
  end
end
