class MessagesController < ApplicationController
  def new
    @relationships = Relationship.find_by(followed_id: params[:followed_id], follower_id: current_user.id)
    @message = Message.new
  end
  
  def new1
    @relationships = Relationship.find_by(follower_id: params[:follower_id], followed_id: current_user.id)
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    relationship = Relationship.find(message_params[:relationship_id])
    if @message.save
      redirect_to messages_path(relationship_id: relationship.id), method: :get
    else
      @messages = relationship.messages
      redirect_to root_path
    end
  end
  
  def index
    @messages = Message.where(relationship_id: params[:relationship_id])
  end
  
  private
    
    def message_params
      params.require(:message).permit(:content, :relationship_id).merge(user_id: current_user.id)
      #params[:message].merge!({ user_id: current_user.id, room_id: @room.id })
    end
end
