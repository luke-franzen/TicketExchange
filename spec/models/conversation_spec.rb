require 'rails_helper'
require 'spec_helper'

describe Conversation do
    describe 'Between' do
        it 'Should run SQL relation' do
            expect(Conversation.between(1,5)).to be_truthy    
        end
    end
end