class MessagesController < ApplicationController
  before_filter :set_current_user
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
  
def index
 @messages = @conversation.messages
   setTitle
   setOver5
   
  if params[:m]
   @over_five = false
   @messages = @conversation.messages
  end
  if @messages.last
   if last_user_id != @current_user.id
    @messages.last.read = true;
   end
  end
  @message = @conversation.messages.new
end

def last_user_id
 last_mess = @messages.last
 last_mess.user_id
end

def setTitle
  if(@conversation.recipient_id == @current_user.id)
   @message_title = User.find(@conversation.sender_id).first_name
  else
   @message_title = User.find(@conversation.recipient_id).first_name
  end
end

def setOver5
  if @messages.length > 5
   @over_five = true
   @messages = @messages[-5..-1]
  end
end

# def new
#   @message = @conversation.messages.new
# end

def create
 if(message_params[:body].nil? || message_params[:body].blank? || message_params[:body].empty? )
  flash[:notice] = "Did not send. Message was empty."
  redirect_to conversation_messages_path(@conversation)
 else
 @message = @conversation.messages.new(message_params)
 #@message.send_email
 @message.save
 redirect_to conversation_messages_path(@conversation)
  
 end
end

private
 def message_params
  params.require(:message).permit(:body, :user_id)
 end
end