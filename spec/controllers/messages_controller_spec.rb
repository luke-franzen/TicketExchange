require 'rails_helper'
require 'spec_helper'

RSpec.describe MessagesController, type: :controller do
    
    before(:each) do
        @conversation = double({:conversation_id => 1, :sender_id => 1, :recipient_id => 5, created_at: "2016-11-14 18:43:55", updated_at: "2016-11-14 18:43:55"})
        @current_user = double({ id: 1, first_name: "jack", last_name: "sparrow", email: "jack_sparrow@gmail.com"})
        allow(Conversation).to receive(:find).with("1").and_return(@conversation)
        controller.instance_variable_set(:@current_user, @current_user)
        # messages = double({id: 1, body: "I would like to buy your ticket!", conversation_id: 1, user_id: 6, read: false}, {id: 2, body: "I would like to buy your ticket!", conversation_id: 1, user_id: 6, read: false})
        # controller.instance_variable_set(:@messages, messages)
        # puts controller.instance_variable_get(:@messages)
        
    end
    
    describe 'Messages' do
        it 'should get the index route' do
            allow(@current_user).to receive(:id).and_return(1)
            #messages = Conversation.new({id: 1, sender_id: 1, recipient_id: 2,  messages: [Message.create!({:body => "asdf", :user_id => 1, :read => false }), Message.new({:body => "asdf", :user_id => 2, :read => false })]})
            mess1 = double(Message.new({:body => "asdf", :user_id => 1, :read => false}))
            mess2 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            
            expect(@conversation).to receive(:messages).and_return([mess1, mess2])
            
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(User).to receive(:find).with(5).and_return(@current_user)
           
            get :index, { :conversation_id => 1, :current_user => @current_user}
        end
        
        it 'should get the previous messages' do
            allow(@current_user).to receive(:id).and_return(1)
            #messages = Conversation.new({id: 1, sender_id: 1, recipient_id: 2,  messages: [Message.create!({:body => "asdf", :user_id => 1, :read => false }), Message.new({:body => "asdf", :user_id => 2, :read => false })]})
            mess1 = double(Message.new({:body => "asdf", :user_id => 1, :read => false}))
            mess2 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess3 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess4 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess5 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess6 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            
            expect(@conversation).to receive(:messages).and_return([mess1, mess2, mess3, mess4, mess5, mess6])
            
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(User).to receive(:find).with(5).and_return(@current_user)
           
            get :index, { :conversation_id => 1, :current_user => @current_user, :m => ""}
        end
        
         it 'should set title different' do
            allow(@current_user).to receive(:id).and_return(1)

            #messages = Conversation.new({id: 1, sender_id: 1, recipient_id: 2,  messages: [Message.create!({:body => "asdf", :user_id => 1, :read => false }), Message.new({:body => "asdf", :user_id => 2, :read => false })]})
            mess1 = double(Message.new({:body => "asdf", :user_id => 1, :read => false}))
            mess2 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess3 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess4 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess5 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            mess6 = double(Message.new({:body => "asdf", :user_id => 2, :read => false}))
            
            expect(@conversation).to receive(:messages).and_return([mess1, mess2, mess3, mess4, mess5, mess6])
            
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(User).to receive(:find).with(5).and_return(@current_user)
           
            get :index, { :conversation_id => 1, :current_user => @current_user}
        end
        
        
        it 'should create a new message' do
            # allow(@conversation).to receive_message_chain(:messages, :new)
            #mess = Message.new(:body => "ahlp", :conversation_id => 1, :user_id => 1, :created_at => DateTime.now)
            post :create, {:conversation_id => 1, :current_user => @current_user, :message => {:body => "h", user_id: 1}}
        end
        
        it 'should flash if message was blank or nil' do
            post :create, {:conversation_id => 1, :current_user => @current_user, :message => {:body => nil, user_id: 1}}
            expect(flash[:notice]).to eq("Did not send. Message was empty.")
        end
    end
end
