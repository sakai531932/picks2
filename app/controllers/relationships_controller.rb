class RelationshipsController < ApplicationController
  
  def follow
    current_user.follow(params[:id])
    #binding.pry
    redirect_to done_page_path
  end
  
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to root_path
  end
  
  def talk_list
    @user = User.find(params[:user_id])
    #@relationships = Relationship.all
    #@relationship = Relationship.find(params[:user_id])
  end
end
