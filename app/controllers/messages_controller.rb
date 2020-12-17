class MessagesController < ApplicationController
  def new
    @relationship = Relationship.find(message_params[:relationship_id])
    #@relationships = Relationship.find_by(followed_id: params[:followed_id], follower_id: current_user.id)
    @message = Message.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new1
    @relationship = Relationship.find(message_params[:relationship_id])
    #@relationships = Relationship.find_by(follower_id: params[:follower_id], followed_id: current_user.id)
    @message = Message.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @messages = Message.where(relationship_id: params[:relationship_id])
    @message = Message.new(message_params)
    #relationship = Relationship.find(message_params[:relationship_id])
    respond_to do |format|
      if @message.save
        format.html
        format.js
      else
        format.js {render :new}
      end
    end  
  end
  
  def index
    @relationships = Relationship.find_by(followed_id: params[:followed_id], follower_id: current_user.id)
    @messages = Message.where(relationship_id: params[:relationship_id])
  end
  
  def index1
    @relationships = Relationship.find_by(follower_id: params[:follower_id], followed_id: current_user.id)
    @messages = Message.where(relationship_id: params[:relationship_id])
  end
  
  private
    
    def message_params
      params.require(:message).permit(:content, :relationship_id).merge(user_id: current_user.id)
      #params[:message].merge!({ user_id: current_user.id, room_id: @room.id })
    end
end
