require 'rails_helper'
require 'spec_helper'

RSpec.describe ConversationsController, type: :controller do
     describe 'Seeing conversations' do
        it 'should show all converstaions for the user' do
            expect(Conversation).to receive(:all)
            get :index
        end
    end
    describe 'Creating a conversation' do
        it 'should create a new conversation' do
            convoSingle = double({id: 2, sender_id: 7, recipient_id: 5, created_at: "2016-11-14 18:45:12", updated_at: "2016-11-14 18:45:12", first: {:conversation_id => 1}})
            allow(Conversation).to receive(:between).and_return(convoSingle)
            allow(@convo).to receive(:first).and_return(Conversation.new({id: 2, sender_id: 7, recipient_id: 5, created_at: "2016-11-14 18:45:12", updated_at: "2016-11-14 18:45:12"}))
            post :create, {"conversation" => {sender_id: 1, recipient_id: 5}}
            expect(response).to redirect_to(conversation_messages_path(1))
        end
        
        it 'should set conversation variable if creation is not needed' do
            allow(Conversation).to receive(:between)
            post :create, {"conversation" => {sender_id: 1, recipient_id: 5}}
            expect(response).to redirect_to(conversation_messages_path(1)) 
        end
    end
end
