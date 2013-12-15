class ProfileController < ApplicationController


  def create
    
  end

  def show
    user = User.find(params[:id]) 
    @profile = Profile.find_by_steam_id(user.uid) || Profile.create_for(user)
    @friend_list = Friend.get_friend_list_for(user)
   
  end


end
