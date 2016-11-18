require 'rails_helper'
require 'spec_helper'

RSpec.describe MessagesController, type: :controller do
    
    before(:each) do
        @conversation = double({:conversation_id => 1, :sender_id => 1, :recipient_id => 5, created_at: "2016-11-14 18:43:55", updated_at: "2016-11-14 18:43:55"})
        @current_user = double({ id: 1, first_name: "jack", last_name: "sparrow", email: "jack_sparrow@gmail.com"})
        allow(Conversation).to receive(:find).with("1").and_return(@conversation)
        controller.instance_variable_set(:@current_user, @current_user)

    end
    
    describe 'Messages' do
        it 'should get the index route' do
            allow(@current_user).to receive(:id).and_return(1)
            Message.delete_all
            allow(@conversation).to receive(:messages).and_return(Message.all)
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(User).to receive(:find).with(5).and_return(@current_user)
            get :index, { :conversation_id => 1, :current_user => @current_user}
        end
        
        it 'should get the previous messages' do
            allow(@current_user).to receive(:id).and_return(1)
            double(Message.create!({:body => "asdf", :user_id => 1, :read => false, :conversation_id => 1}))
            double(Message.create!({:body => "asdf", :user_id => 2, :read => false, :conversation_id => 1}))
            double(Message.create!({:body => "asdf", :user_id => 2, :read => false, :conversation_id => 1}))
            double(Message.create!({:body => "asdf", :user_id => 2, :read => false, :conversation_id => 1}))
            double(Message.create!({:body => "asdf", :user_id => 2, :read => false, :conversation_id => 1}))
            double(Message.create!({:body => "asdf", :user_id => 2, :read => false, :conversation_id => 1}))
            
            allow(@conversation).to receive(:messages).and_return(Message.all)
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(User).to receive(:find).with(5).and_return(@current_user)
            get :index, { :conversation_id => 1, :current_user => @current_user, :m => ""}
        end
        
         it 'should set title different' do
            allow(@current_user).to receive(:id).and_return(1)
            allow(@conversation).to receive(:messages).and_return(Message.all)
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(User).to receive(:find).with(5).and_return(@current_user)
            get :index, { :conversation_id => 1, :current_user => @current_user, :message => {body: "adsf", :user_id => 1}}
        end
        
        
        it 'should create a new message' do
            allow(@conversation).to receive(:messages).and_return(Message.all)
            allow(@message).to receive(:save).and_return(true)
            conversation = double({:conversation_id => 1, :sender_id => 1, :recipient_id => 5, created_at: "2016-11-14 18:43:55", updated_at: "2016-11-14 18:43:55"})
            controller.instance_variable_set(:@conversation, conversation)
            post :create, {:conversation_id => 1, :current_user => @current_user, :message => {:body => "h", user_id: 1}}
        end
        
        it 'should flash if message was blank or nil' do
            post :create, {:conversation_id => 1, :current_user => @current_user, :message => {:body => nil, user_id: 1}}
            expect(flash[:notice]).to eq("Did not send. Message was empty.")
        end
     
        it 'should set title to be current user' do
            conversation = double({:conversation_id => 1, :sender_id => 1, :recipient_id => 5, created_at: "2016-11-14 18:43:55", updated_at: "2016-11-14 18:43:55"})
            controller.instance_variable_set(:@conversation, conversation)
            allow(@conversation).to receive(:recipient_id).and_return(5)
            allow(@current_user).to receive(:id).and_return(5)
            allow(User).to receive(:find).with(@conversation.sender_id).and_return(double({first_name: "Ryan"}))
            controller.setTitle
        end
        
    end
end
