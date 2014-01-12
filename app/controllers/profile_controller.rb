class ProfileController < ApplicationController


  def create
    
  end

  def show
    user = User.find(params[:id]) 
    @profile = Profile.find_by_steam_id(user.uid) || Profile.create_for(user)
    @friend_list = Friend.get_friend_list_for(user).empty? ? Friend.create_friend_list_for(user) : Friend.get_friend_list_for(user)
    @game_list = Game.get_game_list_for(user).empty? ? Game.make_list_for(user) : Game.get_game_list_for(user)
    @user_charts = UserCharts.find_all_by_user_id(user.id).empty? ? "There are no charts yet" : UserCharts.find_all_by_user_id(user.id)
  end


end
