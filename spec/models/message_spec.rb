require 'rails_helper'
require 'spec_helper'

describe Message do
    describe 'Message time' do
        it 'should return time of message' do
            mess = Message.new(:body => "ahlp", :conversation_id => 1, :user_id => 1, :created_at => DateTime.now)
            expect(mess.message_time).to be_truthy 
            mess.message_time
        end
    end
    
    describe 'send_email' do
        it 'should send an email to recipient_id user' do
            mess = Message.new(:body => "ahlp", :conversation_id => 1, :user_id => 1, :created_at => DateTime.now)
            convo = Conversation.new(id: 1, sender_id: 5, recipient_id: 1, created_at: "2016-12-01 02:46:08", updated_at: "2016-12-01 02:46:08")
            u5 = User.new( id: 5, first_name: "jack", last_name: "sparrow", email: "jack_sparrow@gmail.com")
            allow(Conversation).to receive(:find).and_return(convo)
            allow(User).to receive(:find).and_return(u5)
            mess.send_email
        end
        
         it 'should send an email to sender_id user' do
            mess = Message.new(:body => "ahlp", :conversation_id => 1, :user_id => 5, :created_at => DateTime.now)
            convo = Conversation.new(id: 1, sender_id: 5, recipient_id: 1, created_at: "2016-12-01 02:46:08", updated_at: "2016-12-01 02:46:08")
            u1 = User.new( id: 1, first_name: "jack", last_name: "sparrow", email: "jack_sparrow@gmail.com")
            allow(Conversation).to receive(:find).and_return(convo)
            allow(User).to receive(:find).and_return(u1)
            mess.send_email
        end
    end
end