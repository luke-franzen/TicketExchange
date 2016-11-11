#Source: https://medium.com/@danamulder/tutorial-create-a-simple-messaging-system-on-rails-d9b94b0fbca1#.tofdcugrq

class ConversationsController < ApplicationController
 #before_action :authenticate_user
 before_filter :set_current_user

def index
 @users = User.all
 @conversations = Conversation.all
end

def create
 if Conversation.between(params[:sender_id],params[:recipient_id]).present?
    @conversation = Conversation.between(params[:sender_id],
     params[:recipient_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
 end
 redirect_to conversation_messages_path(@conversation)
end

private
 def conversation_params
  params.permit(:sender_id, :recipient_id)
 end
end