require 'rails_helper'
require 'spec_helper'

describe Message do
    describe 'Message time' do
        it 'should return time of message' do
            mess = Message.new(:body => "ahlp", :conversation_id => 1, :user_id => 1, :created_at => DateTime.now)
            expect(mess.message_time).to be_truthy    
        end
    end
end