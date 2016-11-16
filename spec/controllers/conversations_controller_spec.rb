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
