class Message < ActiveRecord::Base
 belongs_to :conversation
 belongs_to :user
 validates_presence_of :body, :conversation_id, :user_id
 
 def message_time
  created_at.getlocal('-06:00').strftime("%m/%d/%y at %l:%M %p")
 end

 
 def send_email
    conversation = Conversation.find(self.conversation_id)
    sender_id = self.user_id
    
    if(conversation.sender_id == sender_id)
        email_user =  User.find(conversation.recipient_id)
    else
        email_user = User.find(conversation.sender_id)
    end
    MessageMailer.new_message(email_user).deliver_now
 end
    
end