class FriendsController < ApplicationController

  def show
    user = User.find(params[:id])
    @friend_list = Friend.create_friend_list_for(user)
  end

end
