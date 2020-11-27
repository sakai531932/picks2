class RelationshipsController < ApplicationController
  
  def follow
    current_user.follow(params[:id])
    redirect_to root_path
  end
  
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to root_path
  end
  
  def talk_list
    @user = User.find(params[:id])
  end
end
